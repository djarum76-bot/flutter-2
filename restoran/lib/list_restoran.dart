import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restoran/detail_restoran.dart';
import 'package:restoran/style.dart';
import 'package:restoran/ui/header_with_search.dart';
import 'package:restoran/ui/item_card.dart';
import 'package:restoran/ui/title_with_underline.dart';

class ListRestoran extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderWithSearch(size: size),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Row(
                children: [
                  TitleWithUnderline(text: 'Recommended',)
                ],
              ),
            ),
            SizedBox(height: kDefaultPaddin,),
            FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
                builder: (context, snapshot){
                  var myData = json.decode(snapshot.data.toString());
                  return Container(
                    height: size.height * 0.6,
                    width: size.width * 0.9,
                    child: ListView.builder(
                      itemBuilder: (context, index){
                        return ItemCard(myData: myData, index: index, press: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DetailRestoran(myData: myData, index: index);
                          }));
                        },);
                      },
                      itemCount: myData == null ? 0 : 10,
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:restoran/style.dart';
//
// class ListRestoran extends StatefulWidget{
//   @override
//   _ListRestoranState createState() => _ListRestoranState();
// }
//
// class _ListRestoranState extends State<ListRestoran> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           middle: Text("Home"),
//         ),
//         child: _buildList(context)
//     );
//   }
//
//   Widget _buildList(BuildContext context){
//     return FutureBuilder(
//         future:
//         DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
//         builder: (context, snapshot){
//           var myData = json.decode(snapshot.data.toString());
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//             child: Container(
//               margin: EdgeInsets.only(left: 24),
//               child: GridView.builder(
//                   itemCount: myData == null ? 0 : 10,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.83,
//                       mainAxisSpacing: kDefaultPaddin,
//                       crossAxisSpacing: kDefaultPaddin
//                   ),
//                   itemBuilder: (context, index) => Item(myData: myData, index: index, press: (){},)
//               ),
//             ),
//           );
//         }
//     );
//   }
// }
//
// class Item extends StatelessWidget {
//   final int index;
//   final Function press;
//   const Item({
//     Key? key,
//     required this.myData, required this.index, required this.press,
//   }) : super(key: key);
//
//   final myData;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.all(kDefaultPaddin),
//             height: 180,
//             width: 160,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               image: DecorationImage(
//                 image: NetworkImage(myData["restaurants"][index]["pictureId"]),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
//             child: Text(
//               myData["restaurants"][index]["name"],
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ListRestoran extends StatefulWidget{
//   @override
//   _ListRestoranState createState() => _ListRestoranState();
// }
//
// class _ListRestoranState extends State<ListRestoran> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           middle: Text("Home"),
//         ),
//         child: _buildList(context)
//     );
//   }
//
//   Widget _buildList(BuildContext context){
//     return FutureBuilder(
//         future:
//         DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
//         builder: (context, snapshot){
//           var myData = json.decode(snapshot.data.toString());
//           return ListView.builder(
//             itemBuilder: (context, index){
//               return Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
//                   leading: Image.network(myData["restaurants"][index]["pictureId"], width: 100,),
//                   title: Text(myData["restaurants"][index]["name"]),
//                 ),
//               );
//             },
//             itemCount: myData == null ? 0 : 10,
//           );
//         }
//     );
//   }
// }