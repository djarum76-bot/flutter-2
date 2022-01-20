import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/auth/auth_services.dart';
import 'package:firebase/auth/wrapper.dart';
import 'package:firebase/cloud/database_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //     value: AuthServices.firebaseUserStream,
    //     initialData: null,
    //     child: MaterialApp(
    //       title: 'Flutter Demo',
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: Wrapper(),
    //     ),
    // );


    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Firestore Demo"),
    //     ),
    //     body: Container(
    //       child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             RaisedButton(
    //                 onPressed: (){
    //                   DatabaseServices.createOrUpdateProduct("3", name: "PC", price: 100000000);
    //                 },
    //                 child: Text("Add Data"),
    //             ),
    //             RaisedButton(
    //               onPressed: (){
    //                 DatabaseServices.createOrUpdateProduct("3", name: "PC Update", price: 1000);
    //               },
    //               child: Text("Edit Data"),
    //             ),
    //             RaisedButton(
    //               onPressed: ()async{
    //                 DocumentSnapshot snapshot = await DatabaseServices.getProduct("3");
    //                 print((snapshot.data() as dynamic)["nama"]);
    //                 print((snapshot.data() as dynamic)["harga"]);
    //               },
    //               child: Text("Get Data"),
    //             ),RaisedButton(
    //               onPressed: ()async{
    //                 await DatabaseServices.deleteProduct("1");
    //               },
    //               child: Text("Delete Data"),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firebase Storage Demo"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imagePath != null
                    ? Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                              image: NetworkImage(imagePath!),
                              fit: BoxFit.cover
                          )
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    onPressed: ()async{

                    },
                    child: Text("Upload Image"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}