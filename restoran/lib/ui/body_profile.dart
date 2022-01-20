import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restoran/style.dart';

class BodyProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        SizedBox(
          width: 115,
          height: 115,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/pp.png"),
          ),
        ),
        SizedBox(height: 20,),
        ItemPP(icon: CupertinoIcons.person, text: "My Account"),
        ItemPP(icon: CupertinoIcons.bell, text: "Notifications"),
        ItemPP(icon: CupertinoIcons.question_circle, text: "Settings"),
        ItemPP(icon: CupertinoIcons.person_2, text: "Help Center"),
        ItemPP(icon: CupertinoIcons.person_badge_minus, text: "Log Out"),
      ],
    );
  }
}

class ItemPP extends StatelessWidget {
  const ItemPP({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: FlatButton(
            padding: EdgeInsets.all(20),
            color: Color(0xFFF5F6F9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            onPressed: (){},
            child: Row(
              children: [
                Icon(icon, size: 30, color: kPrimaryColor,),
                SizedBox(width: 20,),
                Expanded(
                    child: Text(
                      text,
                      style: myTextTheme.bodyText1,
                    )
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            )
        ),
    );
  }
}