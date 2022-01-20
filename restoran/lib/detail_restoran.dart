import 'package:flutter/material.dart';
import 'package:restoran/custom/custom_scaffold.dart';
import 'package:restoran/restoran.dart';
import 'package:restoran/style.dart';
import 'package:restoran/ui/isi_category.dart';
import 'dart:convert';
import 'package:restoran/ui/title_with_underline.dart';

class DetailRestoran extends StatelessWidget{
  final myData;
  final int index;

  DetailRestoran({required this.myData, required this.index});

  @override
  Widget build(BuildContext context) {
    String rating = myData["restaurants"][index]["rating"].toString();
    List foods = myData["restaurants"][index]["menus"]["foods"];
    List drinks = myData["restaurants"][index]["menus"]["drinks"];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: CustomScaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.355,
                      width: size.width,
                      child: ClipRRect(
                        child: Hero(
                            tag: myData["restaurants"][index]["pictureId"],
                            child: Image.network(myData["restaurants"][index]["pictureId"], fit:  BoxFit.cover,)
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)
                        ),
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 60,
                                color: kPrimaryColor.withOpacity(0.4)
                            )
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24,left: 8,right: 8,bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myData["restaurants"][index]["name"],
                                style: myTextTheme.headline4!.copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                myData["restaurants"][index]["city"],
                                style: TextStyle(fontSize: 20, color: kPrimaryColor),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "$rating",
                                style: TextStyle(color: kPrimaryColor, fontSize: 20),
                              ),
                              SizedBox(width: 8,),
                              Icon(Icons.star, color: Colors.yellow,)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(color: Colors.black,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: myTextTheme.headline5!.copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            myData["restaurants"][index]["description"],
                            textAlign: TextAlign.justify,
                            style: myTextTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(color: Colors.black,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 8),
                      child: IsiCategory(myData: myData, index: index)
                    ),
                  ],
                ),
              ),
              myData: myData,
              index: index
          )
      ),
    );
  }
}

class Makanan extends StatelessWidget {
  const Makanan({
    Key? key,
    required this.foods, required this.index2,
  }) : super(key: key);

  final List foods;
  final int index2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Text(
          foods[index2]["name"],
          style: myTextTheme.subtitle1,
          textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kPrimaryColor)
      ),
    );
  }
}

class Minuman extends StatelessWidget {
  const Minuman({
    Key? key,
    required this.drinks, required this.index2,
  }) : super(key: key);

  final List drinks;
  final int index2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Text(
        drinks[index2]["name"],
        style: myTextTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kPrimaryColor)
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:restoran/custom/custom_scaffold.dart';
// import 'package:restoran/restoran.dart';
// import 'package:restoran/style.dart';
// import 'package:restoran/ui/categories.dart';
// import 'dart:convert';
// import 'package:restoran/ui/title_with_underline.dart';
//
// class DetailRestoran extends StatelessWidget{
//   final myData;
//   final int index;
//
//   DetailRestoran({required this.myData, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     String rating = myData["restaurants"][index]["rating"].toString();
//     List foods = myData["restaurants"][index]["menus"]["foods"];
//     List drinks = myData["restaurants"][index]["menus"]["drinks"];
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//           child: CustomScaffold(
//               body: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: size.height * 0.355,
//                       width: size.width,
//                       child: ClipRRect(
//                         child: Hero(
//                             tag: myData["restaurants"][index]["pictureId"],
//                             child: Image.network(myData["restaurants"][index]["pictureId"], fit:  BoxFit.cover,)
//                         ),
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                                 offset: Offset(0, 10),
//                                 blurRadius: 60,
//                                 color: kPrimaryColor.withOpacity(0.4)
//                             )
//                           ]
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 24,left: 8,right: 8,bottom: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 myData["restaurants"][index]["name"],
//                                 style: Theme.of(context).textTheme.headline4!.copyWith(color: kTextColor, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 myData["restaurants"][index]["city"],
//                                 style: TextStyle(fontSize: 20, color: kPrimaryColor),
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "$rating",
//                                 style: TextStyle(color: kPrimaryColor, fontSize: 20),
//                               ),
//                               SizedBox(width: 8,),
//                               Icon(Icons.star, color: Colors.yellow,)
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8),
//                       child: Divider(color: Colors.black,),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Description",
//                             style: Theme.of(context).textTheme.headline5!.copyWith(color: kTextColor, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8,),
//                           Text(
//                             myData["restaurants"][index]["description"],
//                             textAlign: TextAlign.justify,
//                             style: Theme.of(context).textTheme.bodyText1,
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8),
//                       child: Divider(color: Colors.black,),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 8,right: 8,top: 8),
//                       child: Categories(),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       height: size.height * 0.4,
//                       child: GridView.builder(
//                           itemCount: foods.length,
//                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,childAspectRatio: 5.5),
//                           itemBuilder: (context, index2){
//                             return Makanan(foods: foods, index2: index2,);
//                           }
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               myData: myData,
//               index: index
//           )
//       ),
//     );
//   }
// }
//
// class Makanan extends StatelessWidget {
//   const Makanan({
//     Key? key,
//     required this.foods, required this.index2,
//   }) : super(key: key);
//
//   final List foods;
//   final int index2;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(8),
//       child: Text(
//         foods[index2]["name"],
//         style: Theme.of(context).textTheme.subtitle1,
//         textAlign: TextAlign.center,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(32)
//       ),
//     );
//   }
// }
//
// class Minuman extends StatelessWidget {
//   const Minuman({
//     Key? key,
//     required this.drinks, required this.index2,
//   }) : super(key: key);
//
//   final List drinks;
//   final int index2;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(8),
//       child: Text(
//         drinks[index2]["name"],
//         style: Theme.of(context).textTheme.subtitle1,
//         textAlign: TextAlign.center,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(32)
//       ),
//     );
//   }
// }