import 'package:flutter/material.dart';
import 'package:valorant/model/agent_list.dart';

class ThirdScreen extends StatelessWidget{
  final AgentList agent;

  ThirdScreen({required this.agent});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset(agent.gambar),
                  SafeArea(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                }, 
                                icon: Icon(Icons.arrow_back, color: Colors.white,)
                            ),
                          ),
                      )
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(4),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          agent.nama,
                          style: TextStyle(fontFamily: 'valorant',fontSize: 32),
                        ),
                        Text(
                          agent.role,
                          style: TextStyle(fontFamily: 'valorant',fontSize: 32),
                        )
                      ],
                    ),
                  ),
              ),
              Padding(
                  padding: EdgeInsets.all(4),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      content: Text(
                                        agent.deskripsiSkillQ,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'quicksand',
                                          fontSize: 16,
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            child: Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Image.asset(agent.gambarQ, width: 75,height: 75,),
                                  SizedBox(height: 8,),
                                  Text(
                                    agent.skillQ,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'valorant',
                                        color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      content: Text(
                                        agent.deskripsiSkillE,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'quicksand',
                                            fontSize: 16
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            child: Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Image.asset(agent.gambarE, width: 75,height: 75,),
                                  SizedBox(height: 8,),
                                  Text(
                                    agent.skillE,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'valorant',
                                        color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      content: Text(
                                        agent.deskripsiSkillC,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'quicksand',
                                            fontSize: 16
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            child: Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Image.asset(agent.gambarC, width: 75,height: 75,),
                                  SizedBox(height: 8,),
                                  Text(
                                    agent.skillC,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'valorant',
                                        color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      content: Text(
                                        agent.deskripsiSkillX,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'quicksand',
                                            fontSize: 16
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            child: Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Image.asset(agent.gambarX, width: 75,height: 75,),
                                  SizedBox(height: 8,),
                                  Text(
                                    agent.skillX,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'valorant',
                                        color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ),
              Padding(
                  padding: EdgeInsets.all(4),
                  child: Card(
                    child: Text(
                      agent.biografi,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'quicksand',
                      ),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}