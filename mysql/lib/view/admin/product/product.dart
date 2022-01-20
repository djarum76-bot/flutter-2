import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mysql/model/produkModel.dart';
import 'package:http/http.dart' as http;
import 'package:mysql/view/admin/product/editProduk.dart';
import 'package:mysql/view/admin/product/tambahProduk.dart';

class Product extends StatefulWidget{
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
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
      print(data);
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
        loading = false;
      });
    }
  }

  _delete(String id)async {
    final response = await http.post(Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/deleteProduk.php"),body: {
      "idProduk": id
    });

    final data = jsonDecode(response.body);

    int value = data['value'];
    String message = data['message'];

    if(value == 1){
      setState(() {
        _lihatData();
      });
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
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: RefreshIndicator(
          child: loading
              ? Center(child: CircularProgressIndicator(),)
              : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index){
                final x = list[index];
                return Padding(
                  padding: EdgeInsets.only(top: 8,left: 8,right: 8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.network(
                                "https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/upload/"+x.image,
                                width: 100,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            SizedBox(width: 8,),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(x.namaProduk,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(x.qty),
                                    Text(money.format(int.parse(x.harga))),
                                    Text(x.nama),
                                    Text(x.createdDate)
                                  ],
                                )
                            ),
                            IconButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return EditProduk(model: x,reload: _lihatData);
                                  }));
                                },
                                icon: Icon(Icons.edit)
                            ),
                            IconButton(
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    // false = user must tap button, true = tap outside dialog
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('WARNING!!!'),
                                        content: Text('Are you sure you want to delete this product ?'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('No'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                              onPressed: (){
                                                _delete(x.id);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Yes")
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
          onRefresh: _lihatData,
          key: _refresh,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return TambahProduk(reload: _lihatData,);
            }));
          },
          child: Icon(Icons.add),
      ),
    );
  }
}