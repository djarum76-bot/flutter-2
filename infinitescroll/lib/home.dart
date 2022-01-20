import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> imageList = [];

  ScrollController _scroll = new ScrollController();

  _fetchData()async {
    final response = await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search"));

    if(response.statusCode == 200){
      setState(() {
        imageList.add(jsonDecode(response.body)[0]['url']);
      });
    }else{
      print("Gagal");
    }
  }

  _fetchDataEnam(){
    for(var i = 0; i < 6; i++){
      _fetchData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataEnam();

    _scroll.addListener(() {
      if(_scroll.position.pixels == _scroll.position.maxScrollExtent){
        _fetchDataEnam();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          controller: _scroll,
          itemCount: imageList.length,
          itemBuilder: (context,index){
            return Container(
              height: 200,
              child: Card(
                child: Image.network(
                  imageList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
      )
    );
  }
}