import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget{
  @override
  _ExplicitAnimationState createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation> with TickerProviderStateMixin{
  late AnimationController _controller;
  late AnimationController _iconController;
  bool _isRotating = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );

    _iconController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
  }

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
            RotationTransition(
                turns: _controller,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
            ),
            IconButton(
                iconSize: 36,
                onPressed: (){
                  if(_isRotating){
                    _controller.stop();
                    _iconController.reverse();
                  }else{
                    _controller.repeat();
                    _iconController.forward();
                  }
                },
                icon: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: _iconController
                )
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _iconController.dispose();
    super.dispose();
  }
}