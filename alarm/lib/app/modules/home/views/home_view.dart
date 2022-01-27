import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  showPicker(
                    context: context,
                    value: TimeOfDay.now(),
                    onChange: controller.onTimeChanged,
                    minuteInterval: MinuteInterval.FIVE,
                    // Optional onChange to receive value as DateTime
                    onChangeDateTime: (DateTime dateTime)async{
                      final int helloAlarmID = 0;
                      await AndroidAlarmManager.oneShotAt(dateTime, helloAlarmID, (){
                          int isolateId = Isolate.current.hashCode;
                          print("[$dateTime] Hello, world! isolate=${isolateId}");
                      });
                    },
                  ),
                );
              },
              child: Text('SELECT TIME'),
            ),
            SizedBox(height: 8),
            Obx((){
              return controller.time.value == TimeOfDay.now()
                  ? Text(
                'Selected time: ${controller.time.value.format(context)}',
              )
                  : Text(
                'Selected time: ${controller.time.value.format(context)}',
              );
            })
          ],
        ),
      ),
    );
  }
}
