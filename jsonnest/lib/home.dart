import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonnest/model.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UsersDetail> _list = [];

  var loading = false;

  Future<Null> fetchData()async{
    _list.clear();
    setState(() {
      loading = true;
    });
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for(Map i in data){
          _list.add(UsersDetail.fromJson(i));
        }

        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading
          ? Center(child: CircularProgressIndicator(),)
          : ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context,index){
            final x = _list[index];
            return Container(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${x.id}"),
                    Text(x.name),
                    Text(x.username),
                    Text(x.email),
                    Text(x.address.street),
                    Text(x.address.suite),
                    Text(x.address.city),
                    Text(x.address.zipcode),
                    Text(x.phone),
                    Text(x.website),
                    Text(x.company.name),
                    Text(x.company.catchPhrase),
                    Text(x.company.bs),
                  ],
                ),
              ),
            );
          }
      )
    );
  }
}