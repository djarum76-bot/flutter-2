import 'dart:math';
import 'package:flutter/material.dart';

/*class AnimationPage extends StatefulWidget{
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double _size = 100.0;
  //Tween _animationTween = Tween<double>(begin: 0, end: pi * 2);
  Tween _colorTween = ColorTween(begin: Colors.blue, end: Colors.red)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<Color>(
                tween: _colorTween,
                duration: Duration(seconds: 3),
                builder: (context, double value, child){
                  return Transform.rotate(
                      angle: value,
                      child: Container(
                        color: Colors.blue,
                        height: _size,
                        width: _size,
                      ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}*/