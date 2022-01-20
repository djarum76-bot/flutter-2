import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
   final String itemHolder ;
   DetailScreen({Key? key, required this.itemHolder}) : super(key: key);

   goBack(BuildContext context){
    Navigator.pop(context);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Center(child:
          Text('Selected Item = ' + itemHolder,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),

          RaisedButton(
            onPressed: () {goBack(context);},
            color: Colors.lightBlue,
            textColor: Colors.white,
            child: Text('Go Back To Previous Screen'),
          )])
    );
  }
}