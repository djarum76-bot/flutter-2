import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 0.5, // has the effect of extending the shadow
              offset: Offset(
                1.0, // horizontal, move right 10
                1.0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx((){
                  return controller.playerState.value == PlayerState.PLAYING
                      ? IconButton(
                            onPressed: (){
                              controller.pause();
                            },
                            iconSize: 50.0,
                            icon: Icon(Icons.pause),
                            color: Colors.orange.shade300
                        )
                      : IconButton(
                            onPressed: (){
                              controller.play();
                            },
                            iconSize: 50.0,
                            icon: Icon(Icons.play_arrow),
                            color: Colors.orange.shade300
                        );
                }),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Obx((){
                        return Slider(
                          inactiveColor: Colors.orange.shade300,
                          activeColor: Colors.orange.shade900,
                          onChanged: (v) {
                            final Position = v * controller.duration.value.inMilliseconds;
                            controller.audioPlayer.seek(Duration(milliseconds: Position.round()));
                          },
                          value: (controller.position.value != null &&
                              controller.duration.value != null &&
                              controller.position.value.inMilliseconds > 0 &&
                              controller.position.value.inMilliseconds <
                                  controller.duration.value.inMilliseconds)
                              ? controller.position.value.inMilliseconds / controller.duration.value.inMilliseconds
                              : 0.0,
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Obx((){
                    return Text(
                      controller.position.value != null
                          ? '${controller.positionText ?? ''} / ${controller.durationText ?? ''}'
                          : controller.duration != null ? controller.durationText : '',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
