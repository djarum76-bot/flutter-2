import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mysql/model/produkModel.dart';
import 'package:mysql/view/user/produk/detailProduk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductUser extends StatefulWidget{
  String idUsers;
  final VoidCallback jumlahkeranjang;

  ProductUser({required this.idUsers, required this.jumlahkeranjang});

  @override
  State<ProductUser> createState() => _ProductUserState();
}

class _ProductUserState extends State<ProductUser> {
  final money = NumberFormat("#,##0","en_US");

  var loading = false;

  final list = <ProdukModel>[];
  final GlobalKey<RefreshIndicatorState> _refresh = GlobalKey<RefreshIndicatorState>();

  Future<void> _lihatData()async{
    list.clear();
    setState(() {
      loading = true;
    });
    final response = await http.get(Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/lihatProduk.php"));
    if(response.contentLength == 2){

    }else{
      final data = jsonDecode(response.body);
      data.forEach((api){
        final ab = new ProdukModel(
          id: api['id'],
          namaProduk: api['namaProduk'],
          qty: api['qty'],
          harga: api['harga'],
          createdDate: api['createdDate'],
          idUsers: api['idUsers'],
          nama: api['nama'],
          image: api['image'],
          expDate: api['ExpDate'],
        );
        list.add(ab);
      });
      setState(() {
        widget.jumlahkeranjang();
        loading = false;
      });
    }
  }

  tambahKeranjang(String idProduk, String harga)async{
    final response = await http.post(Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/tambahKeranjang.php"),body: {
      "idUsers" : widget.idUsers,
      "idProduk" : idProduk,
      "harga" : harga
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];

    if(value == 1){
      print(message);
      widget.jumlahkeranjang();
    }else{
      print(message);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lihatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            child: loading
                ? CircularProgressIndicator()
                : OrientationBuilder(
                builder: (context, orientation){
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: orientation == Orientation.portrait ? 2 : 3
                    ),
                    itemBuilder: (context, index){
                      final x = list[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DetailProduk(model: x);
                          }));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                    tag: x.id,
                                    child: ClipRRect(
                                      child: Image.network(
                                        "https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/upload/"+x.image,
                                        width: orientation == Orientation.portrait ? 200 : 250,
                                        height: orientation == Orientation.portrait ? 120 : 200,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    )
                                ),
                                SizedBox(height: 6,),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  x.namaProduk,
                                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                                              ),
                                              Text(
                                                  "Rp. " + money.format(int.parse(x.harga)),
                                                  style: TextStyle(color: Colors.orange)
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                    Expanded(
                                        child: RaisedButton(
                                          onPressed: (){
                                            tambahKeranjang(x.id, x.harga);
                                          },
                                          color: Colors.orange,
                                          child: Text("Beli",style: TextStyle(color: Colors.white, fontSize: 20),),
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: list.length,
                  );
                }
            ),
            onRefresh: _lihatData,
            key: _refresh,
        )
    );
  }
}