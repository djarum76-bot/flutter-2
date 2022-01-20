import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restoran/list_restoran.dart';
import 'package:restoran/ui/profile.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), 
                  title: Text("Home")
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  title: Text("Me")
              ),
            ]
        ),
        tabBuilder: (context, index){
          switch(index){
            case 0:
              return ListRestoran();
            case 1:
              return Profile();
            default:
              return Placeholder();
          }
        }
    );
  }
}