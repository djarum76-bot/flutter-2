import 'package:intl/intl.dart';

class DateTimeHelper{
  static DateTime format(){

    //Date and Time format
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/D');
    final timeSpecific = "08:00:00";
    final completeFormat = DateFormat("y/M/D H:m:s");

    //Today format
    final todayDate = dateFormat.format(now);
    final todayDateAndTime = "$todayDate $timeSpecific";
    var resultToday = completeFormat.parseStrict(todayDateAndTime);

    //Tomorrow format
    var formatted = resultToday.add(Duration(days: 1));
    final tomorrowDate = dateFormat.format(formatted);
    final tomorrowDateAndTime = "$tomorrowDate $timeSpecific";
    var resultTomorrow = completeFormat.parseStrict(tomorrowDateAndTime);

    return now.isAfter(resultToday) ? resultTomorrow : resultToday;
  }
}