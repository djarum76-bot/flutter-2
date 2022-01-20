import 'package:flutter/material.dart';
import 'package:restoran/style.dart';

class HeaderWithSearch extends StatelessWidget {
  const HeaderWithSearch({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPaddin * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: kDefaultPaddin,
                right: kDefaultPaddin,
                bottom: 36 + kDefaultPaddin
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36)
                )
            ),
            child: Row(
              children: [
                Text(
                  "Hi Player",
                  style: myTextTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset("assets/valo.png")
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23)
                      )
                    ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5)
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.search)
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}