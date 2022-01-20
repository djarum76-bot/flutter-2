import 'package:flutter/material.dart';
import 'package:sliver/learning_path_list.dart';

class LearningPathPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dicoding Learning Path"),
      ),
      body: LearningPageList(),
    );
  }
}