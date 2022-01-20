import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tugaskuliah/model/barang.dart';

class DetailPage extends StatelessWidget{
  final NumberFormat money;
  final Barang barang;

  const DetailPage({Key? key, required this.barang, required this.money}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.network(barang.gambar,fit: BoxFit.fill,),
              ),
              Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(barang.nama,style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 24),fontWeight: FontWeight.w500),),
                          Text("Rp : " + money.format(barang.harga),style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 24),fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Text(barang.desc,style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20)),textAlign: TextAlign.justify,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}