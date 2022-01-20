import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/utils/background_service.dart';
import 'package:newsapp/utils/date_time_helper.dart';

class SchedulingProvider extends ChangeNotifier{
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value;
    if(_isScheduled){
      print("Scheduling News Activated");
      notifyListeners();
      return await AndroidAlarmManager.periodic(
          Duration(hours: 24),
          1,
          BackgroundService.callback,
          startAt: DateTimeHelper.format(),
          exact: true,
          wakeup: true
      );
    }else{
      print("Scheduling News Cancelled");
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}