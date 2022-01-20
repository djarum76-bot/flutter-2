import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:set_state/module_page.dart';
import 'package:set_state/provider/done_module_provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DoneModuleProvider(),
        child: MaterialApp(
          title: "Flutter Demo",
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity
          ),
          debugShowCheckedModeBanner: false,
          home: ModulePage(),
        ),
    );
  }
}