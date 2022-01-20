import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:newsapp/common/navigation.dart';
import 'package:newsapp/data/model/article.dart';
import 'package:newsapp/ui/article_detail_page.dart';
import 'package:newsapp/ui/article_web_view.dart';
import 'package:newsapp/ui/home_page.dart';
import 'package:newsapp/common/styles.dart';
import 'package:newsapp/utils/background_service.dart';
import 'package:newsapp/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if(Platform.isAndroid){
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotification(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter News',
      theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              textTheme: myTextTheme.apply(bodyColor: Colors.black),
              elevation: 0
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: secondaryColor,
                  textStyle: TextStyle(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(0)
                      )
                  )
              )
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: secondaryColor,
            unselectedItemColor: Colors.grey
          )
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ArticleDetailPage.routeName: (context) =>
            ArticleDetailPage(article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) =>
            ArticleWebView(url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}