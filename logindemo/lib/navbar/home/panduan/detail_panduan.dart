import 'package:get/get.dart';
import 'package:logindemo/navbar/home/panduan/guide.dart';
import 'package:flutter/material.dart';

class DetailPanduan extends StatelessWidget {
  final Guide guide;
  DetailPanduan({Key? key, required this.guide}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.assignment,
          color: Colors.white,
          size: 40,
        ),
        Container(
          width: Get.height * 0.11029411764,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          guide.title,
          style: TextStyle(color: Colors.white, fontSize: 35.0),
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: Get.height * 0.01225490196),
            height: MediaQuery.of(context).size.height * 0.2,
            ),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          padding: EdgeInsets.all(Get.height * 0.04901960784),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xFF1A237E)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: Get.height * 0.00980392156,
          top: Get.height * 0.07352941176,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );

    final bottomContentText = Text(
      guide.content,
      style: TextStyle(fontSize: 18.0),
    );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
         title: new Text("Detail Panduan"),
         backgroundColor: Color(0xFF1A237E),
      ),
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
