import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation & Routing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/secondScreen');
                },
                child: Text("Go to Second Screen")
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/secondScreenWithData',arguments: "Bilz");
                },
                child: Text("Navigation with data")
            ),
            ElevatedButton(
                onPressed: () async{
                  final result = await Navigator.pushNamed(context, '/returnDataScreen');
                  SnackBar snackBar = SnackBar(content: Text("$result"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text("Return Data from Another Screen")
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/replacementScreen');
                },
                child: Text("Replace Screen")
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text("Back")
      ),
    );
  }
}

class SecondScreenWithData extends StatelessWidget{
  final String data;

  SecondScreenWithData(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data, style: TextStyle(fontSize: 32),),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text("Back")
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnDataScreen extends StatefulWidget{
  @override
  _ReturnDataScreenState createState() => _ReturnDataScreenState();
}

class _ReturnDataScreenState extends State<ReturnDataScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(hintText: "Input pntk"),
                ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context, _textController.text);
                },
                child: Text("Send")
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose(){
    _textController.dispose();
    super.dispose();
  }
}

class ReplacementScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/anotherScreen');
            },
            child: Text("Go to another screen")
        ),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Balik ke FirstScreen"),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Back")
            )
          ],
        ),
      ),
    );
  }
}