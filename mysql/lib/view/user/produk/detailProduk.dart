import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mysql/model/produkModel.dart';

class DetailProduk extends StatefulWidget{
  final ProdukModel model;

  const DetailProduk({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final money = NumberFormat("#,##0","en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled){
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.3,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Hero(
                            tag: widget.model.id,
                            child: Image.network(
                              "https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/upload/"+widget.model.image,
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                  )
                ];
              },
              body: Stack(
                children: [
                  Positioned(
                      top: 30,
                      right: 10,
                      left: 10,
                      child: Column(
                        children: [
                          Text(widget.model.namaProduk),
                          Text("Rp. " + money.format(int.parse(widget.model.harga)))
                        ],
                      )
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Material(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: (){},
                          child: Text("Add Cart",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  )
                ],
              )
          )
      )
    );
  }
}