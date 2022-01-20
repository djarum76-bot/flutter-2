import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url Launcher Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: ()async{
                  await call('+62822642');
                },
                child: Text("Call", style: TextStyle(fontSize: 20),)
            ),
            ElevatedButton(
                onPressed: ()async{
                  await sendSMS('+6234234435');
                },
                child: Text("SMS",style: TextStyle(fontSize: 20),)
            ),
            ElevatedButton(
                onPressed: ()async{
                  await sendEmail('habil0105@gmail.com');
                },
                child: Text("Email",style: TextStyle(fontSize: 20),)
            ),
            ElevatedButton(
                onPressed: ()async{
                  //await openUrl('https://www.youtube.com/c/EricoDarmawanHandoyo');
                  // await openUrl('https://www.amazon.com/',forceWebView: true,enableJavaScript: true);
                  await openUrl('amazon.com');
                },
                child: Text("URL",style: TextStyle(fontSize: 20),)
            ),
          ],
        ),
      ),
    );
  }

  Future<void> call(String phoneNumber)async{
    await launch('tel:$phoneNumber');
  }

  Future<void> sendSMS(String phoneNumber)async{
    await launch('sms:$phoneNumber');
  }

  Future<void> sendEmail(String email)async{
    await launch('mailto:$email');
  }

  Future<void> openUrl(String url, {bool forceWebView = false, bool enableJavaScript = false})async{
    if(await canLaunch(url)){
      await launch(url,forceWebView: forceWebView,enableJavaScript: enableJavaScript);
    }
  }
}