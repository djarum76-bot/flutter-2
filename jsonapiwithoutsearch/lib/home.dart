import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonapiwithoutsearch/model.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Posts> _list = [];
  List<Posts> _search = [];

  var loading = false;

  Future<Null> fetchData()async{
    setState(() {
      loading = true;
    });

    _list.clear();

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for(Map i in data){
          _list.add(Posts.fromJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text)async{
    _search.clear();

    if(text.isEmpty){
      setState(() {

      });
      return;
    }

    _list.forEach((f){
      if(f.title.contains(text) || f.id.toString().contains(text)){
        _search.add(f);
      }
    });

    setState(() {

    });
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
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: (){
                        controller.clear();
                        onSearch('');
                      },
                      icon: Icon(Icons.cancel)
                  ),
                )
              ),
            ),
            loading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                child: _search.length != 0 || controller.text.isNotEmpty
                    ? ListView.builder(
                    itemCount: _search.length,
                    itemBuilder: (context, index){
                      final b = _search[index];
                      return Container(
                        padding: EdgeInsets.all(8),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(b.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(b.body)
                            ],
                          ),
                        ),
                      );
                    }
                )
                    : ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context,index){
                      final a = _list[index];
                      return Container(
                        padding: EdgeInsets.all(8),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(a.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(a.body)
                            ],
                          ),
                        ),
                      );
                    }
                )
            ),
          ],
        )
      ),
    );
  }
}