import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/provider/scheduling_provider.dart';
import 'package:newsapp/widgets/custom_dialog.dart';
import 'package:newsapp/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget{
  static const String settingsTitle = 'Settings';

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: _buildSettingList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Settings"),
        ),
        child: _buildSettingList(context)
    );
  }

  Widget _buildSettingList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text("Dark Theme"),
            trailing: Switch.adaptive(
                value: false,
                onChanged: (valse){
                  customDialog(context);
                }
            ),
          ),
        ),
        Material(
          child: ListTile(
            title: Text("Scheduling News"),
            trailing: Consumer<SchedulingProvider>(
              builder: (context,scheduled,_){
                return Switch.adaptive(
                    value: scheduled.isScheduled,
                    onChanged: (value) async{
                      if(Platform.isIOS){
                        customDialog(context);
                      }else{
                        scheduled.scheduledNews(value);
                      }
                    }
                );
              },
            ),
          ),
        )
      ],
    );
  }
}