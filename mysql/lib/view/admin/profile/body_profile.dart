import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql/style.dart';

class BodyProfile extends StatefulWidget{
  final VoidCallback signOut;

  BodyProfile({required this.signOut});

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {

  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        SizedBox(
          width: 115,
          height: 115,
          child: CircleAvatar(
            backgroundColor: Colors.black87,
          ),
        ),
        SizedBox(height: 20,),
        ItemPP(icon: CupertinoIcons.person, text: "My Account",signOut: (){},),
        ItemPP(icon: CupertinoIcons.bell, text: "Notifications",signOut: (){},),
        ItemPP(icon: CupertinoIcons.question_circle, text: "Settings",signOut: (){},),
        ItemPP(icon: CupertinoIcons.person_2, text: "Help Center",signOut: (){},),
        ItemPP(icon: CupertinoIcons.person_badge_minus, text: "Log Out",signOut: signOut,),
      ],
    );
  }
}

class ItemPP extends StatelessWidget {
  const ItemPP({
    Key? key, required this.icon, required this.text, required this.signOut,
  }) : super(key: key);

  final IconData? icon;
  final String text;
  final Function()? signOut;

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
          onPressed: signOut,
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