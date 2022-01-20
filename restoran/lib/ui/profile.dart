import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restoran/ui/body_profile.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Profile",style: Theme.of(context).textTheme.headline5,)
        ),
        child: SafeArea(
            child: BodyProfile()
        )
    );
  }
}