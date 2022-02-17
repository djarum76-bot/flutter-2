import 'package:flutter/material.dart';

class JudulTabbar extends StatelessWidget {
  const JudulTabbar({
    Key? key,
    required this.judul,
  }) : super(key: key);

  final String judul;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("${judul}"),
      ),
    );
  }
}