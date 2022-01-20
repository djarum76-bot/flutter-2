import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TeksForm extends StatelessWidget{
  final IconData? icon;
  final IconData? icon2;
  final String? hintText;

  const TeksForm({Key? key, required this.icon, required this.hintText, this.icon2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: HexColor("EDE0D4"),
        borderRadius: BorderRadius.all(Radius.circular(32))
      ),
      child: ListTile(
        leading: Icon(icon),
        title: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none
          ),
        ),
        trailing: Icon(icon2),
      ),
    );
  }
}