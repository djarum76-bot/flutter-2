import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(
            'https://picsum.photos/200/300',
            width: 200,
            height: 200,
          ),
          Image.asset(
            'images/yoru.png',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text("Habil", style: TextStyle(fontFamily: 'Oswald', fontSize: 30))
        ],
      ),
    );
  }
}

/*class FirstScreen extends StatefulWidget{
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>{
  String? language = null;
  String? bahasa = null;
  String _name = "";
  bool lightOn = false;
  bool aggree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )
        ),
        title: Text("Habil"),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
                onPressed: (){},
                child: Text("Tombol")
            ),
            TextButton(
                onPressed: (){},
                child: Text("Text Button")
            ),
            OutlineButton(
                onPressed: (){},
                child: Text("Tombol")
            ),
            IconButton(
              onPressed: (){},
              tooltip: 'Menaikkan volume',
              icon: Icon(Icons.volume_up),
            ),
            DropdownButton<String>(
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                      value: 'Dart',
                      child: Text("Dart")
                  ),
                  DropdownMenuItem(
                      value: 'Kotlin',
                      child: Text("Kotlin")
                  ),
                  DropdownMenuItem(
                      value: 'Swift',
                      child: Text("Swift")
                  ),
                ],
                value: language,
                hint: Text("Select language"),
                onChanged: (String? value){
                  setState(() {
                    language = value;
                  });
                },
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan nama',
                        labelText: 'Nama kamu'
                      ),
                      onChanged: (String value){
                        setState(() {
                          _name = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  content: Text("Halo $_name"),
                                );
                              }
                          );
                        },
                        child: Text("Submit")
                    )
                  ],
                ),
            ),
            Switch(
                value: lightOn,
                onChanged: (bool value){
                  setState(() {
                    lightOn = value;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(lightOn ? "Light On" : "Light Off"),
                        duration: Duration(seconds: 1),
                    )
                  );
                }
            ),
            Column(
              children: <Widget>[
                ListTile(
                  leading: Radio<String>(
                      value: 'Dart',
                      groupValue: bahasa,
                      onChanged: (String? value){
                        setState(() {
                          bahasa = value;
                          showSnackBar();
                        });
                      }
                  ),
                  title: Text("Dart"),
                ),
                ListTile(
                  leading: Radio<String>(
                      value: 'Kotlin',
                      groupValue: bahasa,
                      onChanged: (String? value){
                        setState(() {
                          bahasa = value;
                          showSnackBar();
                        });
                      }
                  ),
                  title: Text('Kotlin'),
                ),
                ListTile(
                  leading: Radio<String>(
                      value: 'Swift',
                      groupValue: bahasa,
                      onChanged: (String? value){
                        setState(() {
                          bahasa = value;
                          showSnackBar();
                        });
                      }
                  ),
                  title: Text('Swift'),
                ),
                ListTile(
                  leading: Checkbox(
                      value: aggree,
                      onChanged: (bool? value){
                        setState(() {
                          aggree = value!;
                        });
                      }
                  ),
                  title: Text('Habil Ganteng'),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }

  void showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('$bahasa yang dipilih'),
          duration: Duration(seconds: 1),
      )
    );
  }
}*/