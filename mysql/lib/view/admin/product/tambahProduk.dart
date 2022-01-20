import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mysql/custom/currency.dart';
import 'package:mysql/custom/datePicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';
import 'package:path/path.dart' as path;

class TambahProduk extends StatefulWidget{
  final VoidCallback reload;

  TambahProduk({required this.reload});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  late String namaProduk,qty,harga,idUsers;
  final _key = new GlobalKey<FormState>();
  var _imageFile;

  _pilihGallery()async{
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 1920,
        maxWidth: 1080
    );

    setState(() {
      _imageFile = File(image!.path);
    });
  }

  _pilihKamera()async{
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1920,
      maxWidth: 1080
    );

    setState(() {
      _imageFile = File(image!.path);
    });
  }

  getPref()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idUsers = preferences.getString("id")!;
    });
  }

  check(){
    final form = _key.currentState;
    if(form!.validate()){
      form.save();
      submit();
    }
  }

  submit()async{
    try{
      var stream = http.ByteStream(DelegatingStream.typed(_imageFile.openRead()));
      var length = await _imageFile.length();

      var uri = Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/addProduk.php");
      var request = http.MultipartRequest("POST", uri);

      request.fields['namaProduk'] = namaProduk;
      request.fields['qty'] = qty;
      request.fields['harga'] = harga.replaceAll(",", "");
      request.fields['idUsers'] = idUsers;
      request.fields['expDate'] = "$tgl";

      request.files.add(
          http.MultipartFile(
              "image",
              stream,
              length,
              filename: path.basename(_imageFile.path)
          )
      );

      var response = await request.send();

      if(response.statusCode > 2){
        setState(() {
          widget.reload();
          Navigator.pop(context);
        });
      }else {
        print("Image failed");
      }
    }catch(e){
      debugPrint("Error $e");
    }
  }

  DateTime tgl = new DateTime.now();
  final TextStyle valueStyle = TextStyle(fontSize: 16);
  Future<Null> _selectedDate(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tgl,
        firstDate: DateTime(1992),
        lastDate: DateTime(2099)
    );

    if(picked != null && picked != tgl){
      setState(() {
        tgl = picked;
      });
    }else{

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    var placeholder = Container(
      width: 200,
      height: 300,
      child: Image.asset("img/placeholder.png"),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.82,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                  child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 200,
                                  height: 300,
                                  child: InkWell(
                                    onTap: _pilihKamera,
                                    child: _imageFile == null
                                        ? placeholder
                                        : Image.file(_imageFile,fit: BoxFit.fill,),
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height:8),
                          TextFormField(
                            validator: (e){
                              if(e!.isEmpty){
                                return "Masukkan Nama Produk!";
                              }
                            },
                            onSaved: (e) => namaProduk = e!,
                            decoration: InputDecoration(
                                hintText: "Nama Produk"
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            validator: (e){
                              if(e!.isEmpty){
                                return "Masukkan Quantity Produk!";
                              }
                            },
                            onSaved: (e) => qty = e!,
                            decoration: InputDecoration(
                                hintText: "Quantity"
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              CurrencyFormat()
                            ],
                            validator: (e){
                              if(e!.isEmpty){
                                return "Masukkan Harga Produk!";
                              }
                            },
                            onSaved: (e) => harga = e!,
                            decoration: InputDecoration(
                              hintText: "Harga",
                            ),
                          ),
                          DateDropdown(
                              labelText: "Ini Tanggal",
                              valueText: new DateFormat.yMMMMEEEEd().format(tgl),
                              valueStyle: valueStyle,
                              onPressed: (){
                                _selectedDate(context);
                              },
                          ),
                          SizedBox(height: 25,),
                          ElevatedButton(
                              onPressed: (){
                                check();
                              },
                              child: Text("Submit",style: TextStyle(fontSize: 16),)
                          ),
                        ],
                      )
                  ),
                )
            ),
          ),
        ),
      )
    );
  }
}