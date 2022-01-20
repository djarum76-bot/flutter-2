import 'package:flutter/material.dart';
import 'package:valorant/second_screen.dart';

class FirstScreen extends StatefulWidget{
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.jpg'),
              fit: BoxFit.cover
          )
        ),
        child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 32,right: 32),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Card(
                          color: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8,left: 16,right: 16, bottom: 8),
                            child: Column(
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(fontSize: 32,color: Colors.white, fontFamily: 'valorant'),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Masukkan Nama",
                                      filled: true,
                                      fillColor: Colors.white
                                  ),
                                  onChanged: (String value){
                                    setState(() {
                                      username = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return SecondScreen(username: username);
                                      }));
                                    },
                                    child: Text("Login")
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}