import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double boxSize = 150;
  int numTaps = 0;
  int numDoubleTaps = 0;
  int onLongPress = 0;
  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if(posX == 0){
      center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector"),
      ),
      body: Stack(
        children: [
          Positioned(
              top: posY,
              left: posX,
              child: GestureDetector(
                onPanUpdate: (DragUpdateDetails details){
                  setState(() {
                    double siX = details.delta.dx;
                    double siY = details.delta.dy;
                    posX += siX;
                    posY += siY;
                  });
                },
                onTap: (){
                  setState(() {
                    numTaps++;
                  });
                },
                onDoubleTap: (){
                  setState(() {
                    numDoubleTaps++;
                  });
                },
                onLongPress: (){
                  setState(() {
                    onLongPress++;
                  });
                },
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              )
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(16),
        child: Text(
            'Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $onLongPress',
            style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  void center(BuildContext context){
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }
}