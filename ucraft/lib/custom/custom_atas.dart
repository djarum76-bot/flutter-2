import 'package:flutter/material.dart';
import 'package:ucraft/custom/style.dart';

class CustomAtas extends StatelessWidget{
  late String judul;

  CustomAtas({required this.judul});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        color: tema,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        )
      ),
      child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)
              ),
              SizedBox(width: 16,),
              Text(
                judul,
                style: TextStyle(fontSize: 32),
              )
            ],
          ),
      ),
    );
  }
}