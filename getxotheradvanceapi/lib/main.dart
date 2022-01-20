import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${Get.height}"),
            Text("${Get.width}"),
            Text("${Get.context}"),
            Text("${context.height}"),
            Text("${context.width}"),
            ElevatedButton(
                onPressed: (){
                  Get.to(()=>SecondPage(), arguments: "arg from home page");
                },
                child: Text("Second Page")
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${Get.arguments}"),
            Text("${GetPlatform.isAndroid}"),
            Text("${GetPlatform.isIOS}"),
            Text("${GetPlatform.isDesktop}"),
            Text("${GetPlatform.isMobile}"),
            ElevatedButton(
                onPressed: (){
                  Get.to(() => OtherPage());
                },
                child: Text("Other Page")
            )
          ],
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Other Page"),
            Text("${Get.previousRoute}"),
            Text("${Get.rawRoute}",textAlign: TextAlign.center,),
            Text("${Get.isSnackbarOpen}",textAlign: TextAlign.center,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            // Get.snackbar("Erro", "ss");
            // print("${Get.isSnackbarOpen}");

            // Get.removeRoute(Get.rawRoute!);

            Get.until((route) => Get.currentRoute == '/');
          }
      ),
    );
  }
}