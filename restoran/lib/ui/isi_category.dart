import 'package:flutter/material.dart';
import 'package:restoran/detail_restoran.dart';
import 'package:restoran/style.dart';

class IsiCategory extends StatefulWidget{
  final myData;
  final int index;
  
  IsiCategory({required this.myData, required this.index});
  
  @override
  _IsiCategoryState createState() => _IsiCategoryState(myData: myData, index: index);
}

class _IsiCategoryState extends State<IsiCategory> {
  List<String> category = ["Foods","Drinks"];
  int selectedIndex = 0;

  final myData;
  final int index;
  
  _IsiCategoryState({required this.myData, required this.index});

  @override
  Widget build(BuildContext context) {
    List foods = myData["restaurants"][index]["menus"]["foods"];
    List drinks = myData["restaurants"][index]["menus"]["drinks"];
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index3){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = index3;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin*4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category[index3],
                        style: TextStyle(
                            color: selectedIndex == index3 ? kTextColor2 : kTextLighColor2,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: kDefaultPaddin / 4),
                        height: 2,
                        width: 30,
                        color: selectedIndex == index3 ? Colors.black : Colors.transparent,
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: category.length,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: size.height * 0.35,
          child: GridView.builder(
              itemCount: selectedIndex == 0 ? foods.length : drinks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 5.4),
              itemBuilder: (context, index2){
                if(selectedIndex == 0){
                  return Makanan(foods: foods, index2: index2);
                }else{
                  return Minuman(drinks: drinks, index2: index2);
                }
              }
          ),
        )
      ],
    );
  }
}