import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tombol extends StatelessWidget {
  const Tombol({
    Key? key, required this.height, required this.color, required this.child, this.width, required this.onTap,
  }) : super(key: key);

  final double height;
  final double? width;
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onTap,
        child: child,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
            ),
        ),
      ),
      height: height,
      width: width,
    );
  }
}