import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Tombol extends StatelessWidget{
  late String isi;
  late HexColor backgroundColor;
  late HexColor tulisanColor;
  final VoidCallback aksi;

  Tombol({
    required this.isi,
    required this.backgroundColor,
    required this.tulisanColor, required this.aksi,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: aksi,
          child: Text(isi,style: TextStyle(fontSize: 18),),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              primary: backgroundColor,
              onPrimary: tulisanColor
          )
      ),
      height: 50,
      width: 100,
    );
  }
}