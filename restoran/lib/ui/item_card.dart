import 'package:flutter/material.dart';
import 'package:restoran/style.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.myData, required this.index, required this.press,
  }) : super(key: key);

  final myData;
  final int index;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(bottom: kDefaultPaddin),
        child: Column(
          children: [
            Hero(
                tag: myData["restaurants"][index]["pictureId"],
                child: ClipRRect(
                  child: Image.network(myData["restaurants"][index]["pictureId"]),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                )
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.2)
                    )
                  ]
              ),
              child: Row(
                children: [
                  Text(
                    myData["restaurants"][index]["name"],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}