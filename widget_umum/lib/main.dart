import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Responsive(),
    );
  }
}

class Responsive extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            if(constraints.maxWidth < 600){
              return ListView(
                children: _tabelCok(),
              );
            }else if(constraints.maxWidth < 900){
              return GridView.count(
                  crossAxisCount: 2,
                  children: _tabelCok(),
              );
            }else{
              return GridView.count(
                  crossAxisCount: 6,
                  children: _tabelCok(),
              );
            }
          }
      ),
    );
  }

  List<Widget> _tabelCok(){
    return List<Widget>.generate(20, (index){
      return Container(
        color: Colors.red,
        margin: EdgeInsets.all(8),
        height: 200,
      );
    });
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Row(
        children: [
          Expanded(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                            "MediaQuery = ${screenSize.width.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 18,color: Colors.white),
                            textAlign: TextAlign.center,
                        ),
                        Text(
                            "LayoutBuilder = ${constraints.maxWidth}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                        )
                      ],
                    );
                  }
              ),
          ),
          Expanded(
              flex: 3,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints){
                    return Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "MediaQuery = ${screenSize.width.toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 18,color: Colors.black),
                              textAlign: TextAlign.center,
                          ),
                          Text(
                              "LayoutBuilder = ${constraints.maxWidth}",
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget{
  final String  pesan = "Habil Ganteng";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstScreen"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SecondScreen(pesan);
              }));
            },
            child: Text("Pindah Sceen")
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  String? message = null;

  SecondScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message!),
            OutlineButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Kemba"),
            )
          ],
        ),
      )
    );
  }
}

class Beda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  ExpandedWidget(),
                  FlexibelWidget()
                ],
              ),
              Row(
                children: [
                  ExpandedWidget(),
                  ExpandedWidget(),
                  ExpandedWidget(),
                ],
              ),
              Row(
                children: [
                  FlexibelWidget(),
                  FlexibelWidget(),
                  FlexibelWidget(),
                  FlexibelWidget(),
                  FlexibelWidget(),
                  FlexibelWidget(),
                  FlexibelWidget(),
                ],
              ),
              Row(
                children: [
                  FlexibelWidget(),
                  ExpandedWidget()
                ],
              )
            ],
          )
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal,
            border: Border.all(color: Colors.white)
          ),
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Text("Expanded", style: TextStyle(fontSize: 24,color: Colors.white),),
          ),
        )
    );
  }
}

class FlexibelWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.tealAccent,
            border: Border.all(color: Colors.white)
          ),
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Text("Flexible", style: TextStyle(fontSize: 24, color: Colors.white),),
          ),
        )
    );
  }
}

class Rainbow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              color: Colors.red,
            )
        ),
        Expanded(
            child: Container(
              color: Colors.orange,
            )
        ),
        Expanded(
            child: Container(
              color: Colors.yellow,
            )
        ),
        Expanded(
            child: Container(
              color: Colors.green,
            )
        ),
        Expanded(
            child: Container(
              color: Colors.blue,
            )
        ),
        Expanded(
            child: Container(
              color: Colors.indigo,
            )
        ),
        Expanded(
            child: Container(
              color: Colors.purple,
            )
        ),
      ],
    );
  }
}

class First extends StatelessWidget{
  final List<int> numberList = <int>[1,2,3,4,5,6,7,8,9,10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black)
              ),
              child: Center(
                child: Text('${numberList[index]}',style: TextStyle(fontSize: 50),),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return Divider(
              color: Colors.green,
            );
          },
          itemCount: numberList.length
      ),
    );
  }
}