import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final myData;
  final int index;

  CustomScaffold({required this.body, required this.myData, required this.index});

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
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              myData["restaurants"][index]["name"],
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
