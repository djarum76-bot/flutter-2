import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restoran/home_page.dart';
import 'package:restoran/style.dart';

class Intro extends StatefulWidget{
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  static const _titles = <String>[
    "Hi",
    "Welcome to my \nApplication",
    "Hope you \nenjoy it"
  ];

  late Timer timer;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer){
      if(index < _titles.length - 1){
        setState(() {
          index++;
        });
      }

      if(index == _titles.length){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return HomePage();
        }));
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Center(
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Text(
                  _titles[index],
                  style: myTextTheme.headline2,
                  key: ValueKey(_titles[index]),
                  textAlign: TextAlign.center,
                ),
            ),
          ),
          Positioned(
              bottom: 34,
              right: 34,
              child: FlatButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return HomePage();
                    }));
                  },
                  child: Text("Skip", style: myTextTheme.headline6,)
              )
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
}