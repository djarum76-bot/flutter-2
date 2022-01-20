import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            OutlinedButton(
                onPressed: (){
                  Get.to(() => CountPage());
                },
                child: Text("Next >>")
            )
          ],
        ),
      ),
    );
  }
}

class CountPage extends StatelessWidget{
  final myC = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx((){
              return Text("${myC.count.value}",style: TextStyle(fontSize: 25),);
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => myC.setData()
      ),
    );
  }
}

class MyController extends GetxController{
  var count = 0.obs;

  Future<void> setData()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 99);

    count.value = prefs.getInt('counter')!.toInt();
  }
}

// class MyApp extends StatelessWidget{
//   final myCC = Get.lazyPut(() => MyController(),tag: 'tag-text',fenix: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: (){
//                 Get.to(() => CountPage());
//               },
//               icon: Icon(Icons.arrow_forward_ios)
//           )
//         ],
//       ),
//       body: Center(
//         child: Text(
//           "Home Page",
//           style: TextStyle(fontSize: 35),
//         ),
//       ),
//     );
//   }
// }
//
// class CountPage extends StatelessWidget{
//   final myCC = Get.put(MyController(),permanent: true,tag: 'tag-count');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: (){
//                 Get.to(() => TextPage());
//               },
//               icon: Icon(Icons.email)
//           )
//         ],
//       ),
//       body: Center(
//         child: Obx((){
//           return Text("Angka ${myCC.count.value}", style: TextStyle(fontSize: 35),);
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             myCC.add();
//           }
//       ),
//     );
//   }
// }
//
// class TextPage extends StatelessWidget{
//   // final myCC = Get.put(MyController(),permanent: false,tag: 'tag-text');
//
//   final myCC = Get.find<MyController>(tag: 'tag-text');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Center(
//           child: TextField(
//             controller: myCC.textC,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder()
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyController extends GetxController{
//   var count = 0.obs;
//
//   var textC = TextEditingController();
//
//   void add() => count.value++;
// }