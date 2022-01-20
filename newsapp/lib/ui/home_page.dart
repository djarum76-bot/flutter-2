import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/api/api_service.dart';
import 'package:newsapp/provider/news_provider.dart';
import 'package:newsapp/provider/scheduling_provider.dart';
import 'package:newsapp/ui/article_detail_page.dart';
import 'package:newsapp/ui/article_list_page.dart';
import 'package:newsapp/ui/settings_page.dart';
import 'package:newsapp/utils/notification_helper.dart';
import 'package:newsapp/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _headlineText = 'Headline';
  final NotificationHelper _notificationHelper = NotificationHelper();

  List<Widget> _listWidget = [
    ChangeNotifierProvider<NewsProvider>(
        create: (_) => NewsProvider(apiService: ApiService()),
        child: ArticleListPage(),
    ),
    ChangeNotifierProvider<SchedulingProvider>(
      create: (_) => SchedulingProvider(),
      child: SettingsPage(),
    )
  ];

  @override
  void initState(){
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(ArticleDetailPage.routeName);
  }

  @override
  void dispose(){
    selectNotificationSubject.close();
    super.dispose();
  }

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: _headlineText,
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: SettingsPage.settingsTitle,
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: _bottomNavBarItems),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
