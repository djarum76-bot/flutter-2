import 'package:flutter/material.dart';
import 'package:restoran/style.dart';

class TitleWithUnderline extends StatelessWidget {
  const TitleWithUnderline({
    Key? key, required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPaddin / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(right: kDefaultPaddin / 4),
                height: 7,
                color: kPrimaryColor.withOpacity(0.2),
              )
          )
        ],
      ),
    );
  }
}