import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/common/navigation.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  CustomScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          body,
          _buildShortAppBar(context)
        ],
      )),
    );
  }

  Card _buildShortAppBar(BuildContext context) {
    return Card(
          margin: EdgeInsets.all(0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: (){
                    Navigation.back();
                  },
                  icon: defaultTargetPlatform == TargetPlatform.iOS
                      ? Icon(CupertinoIcons.back)
                      : Icon(Icons.arrow_back)
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  'N',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            ],
          ),
          shape: BeveledRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(16))),
        );
  }
}
