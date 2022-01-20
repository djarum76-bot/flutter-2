import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:simple_android_alarm_manager/utils/background_service.dart';

class HomePage extends StatefulWidget{
  final String title;

  HomePage({required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BackgroundService _service = BackgroundService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    port.listen((_) async => await _service.someTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () async {
                await AndroidAlarmManager.oneShot(
                    Duration(seconds: 5),
                    1,
                    BackgroundService.callback,
                    exact: true,
                    wakeup: true
                );
              },
              child: Text(
                  "Alarm with Delayed (Once)"
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () async {
                await AndroidAlarmManager.oneShotAt(
                    DateTime.now().add(Duration(seconds: 5)),
                    2,
                    BackgroundService.callback,
                    exact: true,
                    wakeup: true
                );
              },
              child: Text(
                  "Alarm with Date Time (Once)"
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () async{
                await AndroidAlarmManager.periodic(
                    Duration(seconds: 3),
                    3,
                    BackgroundService.callback,
                    startAt: DateTime.now(),
                    exact: true,
                    wakeup: true
                );
              },
              child: Text(
                  "Alarm with Periodic"
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () async {
                await AndroidAlarmManager.cancel(3);
              },
              child: Text(
                  "Cancel Alarm by Id"
              ),
            ),
          ],
        ),
      ),
    );
  }
}