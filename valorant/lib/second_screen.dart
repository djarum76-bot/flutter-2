import 'package:flutter/material.dart';
import 'package:valorant/model/agent_list.dart';
import 'package:valorant/third_screen.dart';

class SecondScreen extends StatelessWidget{
  String username;

  SecondScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  username,
                  style: TextStyle(fontSize: 32, fontFamily: 'valorant'),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: listAgent.map((agent){
                        return SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ThirdScreen(agent: agent);
                                }));
                              },
                              child: Card(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(agent.gambar),
                                      SizedBox(height: 8,),
                                      Text(
                                        agent.nama,
                                        style: TextStyle(fontSize: 24, fontFamily: 'valorant'),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}

/*class SecondScreen extends StatelessWidget{
  String username;

  SecondScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'valorant',
                  ),
                ),
                SizedBox(height: 64,),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    final AgentList agent = listAgent[index];
                    return InkWell(
                      onTap: (){},
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Image.asset(agent.gambar)
                            ),
                            SizedBox(height: 8,),
                            Text(
                              agent.nama,
                              style: TextStyle(fontSize: 16, fontFamily: 'valorant'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: listAgent.length,
                )
              ],
            ),
          )
      ),
    );
  }
}*/