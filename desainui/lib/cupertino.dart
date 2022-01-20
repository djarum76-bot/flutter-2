import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptivePage extends StatefulWidget{
  @override
  _AdaptivePageState createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  bool _isSelected = true;

  double _sliderValue = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adaptive Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch.adaptive(
                value: _isSelected,
                onChanged: (value){
                  setState(() {
                    _isSelected = value;
                  });
                }
            ),
            Slider.adaptive(
                value: _sliderValue,
                min: 0,
                max: 100,
                onChanged: (value){
                  setState(() {
                    _sliderValue = value;
                  });
                }
            ),
            defaultTargetPlatform == TargetPlatform.iOS
                  ? Text('iOS')
                  : Text('Android')
          ],
        ),
      ),
    );
  }
}