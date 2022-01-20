import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mysql/custom/currency.dart';
import 'package:mysql/custom/datePicker.dart';
import 'package:mysql/model/produkModel.dart';
import 'package:async/async.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class EditProduk extends StatefulWidget{
  final ProdukModel model;
  final VoidCallback reload;

  EditProduk({required this.model, required this.reload});

  @override
  State<EditProduk> createState() => _EditProdukState();
}

class _EditProdukState extends State<EditProduk> {
  late String namaProduk, qty, harga, idUsers;
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

  late TextEditingController txtNama, txtQty,txtHarga;
  String tgldate = '';

  setup()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      idUsers = preferences.getString("id")!;
    });

    tgldate = new DateFormat.yMMMMEEEEd().format(DateTime.parse(widget.model.expDate));
    txtNama = TextEditingController(text: widget.model.namaProduk);
    txtQty = TextEditingController(text: widget.model.qty);
    txtHarga = TextEditingController(text: widget.model.harga);
  }

  check(){
    final form = _key.currentState;
    if(form!.validate()){
      form.save();
      submit();
    }else{}
  }

  submit()async{
    try{
      var stream = http.ByteStream(DelegatingStream.typed(_imageFile.openRead()));
      var length = await _imageFile.length();

      var uri = Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/editProduk.php");
      var request = http.MultipartRequest("POST", uri);

      request.fields['namaProduk'] = namaProduk;
      request.fields['qty'] = qty;
      request.fields['harga'] = harga.replaceAll(",", "");
      request.fields['idUsers'] = idUsers;
      request.fields['idProduk'] = widget.model.id;
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

    // final response = await http.post(Uri.parse("http://192.168.100.175/login/api/editProduk.php"),body: {
    //   "namaProduk": namaProduk,
    //   "qty": qty,
    //   "harga": harga.replaceAll(",", ""),
    //   "idProduk": widget.model.id,
    //   "expDate":"$tgl"
    // });
    //
    // final data = jsonDecode(response.body);
    // int value = data['value'];
    // String message = data['message'];
    //
    // if(value == 1){
    //   setState(() {
    //     widget.reload();
    //     Navigator.pop(context);
    //   });
    //   print(message);
    // }else{
    //   print(message);
    // }
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
        tgldate = new DateFormat.yMMMMEEEEd().format(tgl);
      });
    }else{

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Produk"),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
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
                                      ? Image.network("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/upload/"+ widget.model.image)
                                      : Image.file(_imageFile,fit: BoxFit.fill,),
                                )
                            ),
                          ],
                        ),
                        SizedBox(height:8),
                        TextFormField(
                          controller: txtNama,
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
                          controller: txtQty,
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
                          controller: txtHarga,
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
                          valueText: tgldate,
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
      )
    );
  }
}