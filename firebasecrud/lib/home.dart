import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String studentName, studentID, studyProgramID;
  late double studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    Map<String, dynamic> student = {
      "studentName" : studentName,
      "studentID" : studentID,
      "studyProgramID" : studyProgramID,
      "studentGPA" : studentGPA,
    };
    
    documentReference.set(student).whenComplete((){
      print("$studentName created");
    });
  }

  readData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    documentReference.get().then((datasnapshot){
      print((datasnapshot.data() as dynamic)["studentName"]);
      print((datasnapshot.data() as dynamic)["studentID"]);
      print((datasnapshot.data() as dynamic)["studyProgramID"]);
      print((datasnapshot.data() as dynamic)["studentGPA"]);
    });
  }

  updateData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    Map<String, dynamic> student = {
      "studentName" : studentName,
      "studentID" : studentID,
      "studyProgramID" : studyProgramID,
      "studentGPA" : studentGPA,
    };

    documentReference.set(student).whenComplete((){
      print("$studentName updated");
    });
  }

  deleteData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudent").doc(studentName);

    documentReference.delete().whenComplete((){
      print("$studentName deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2)
                      )
                  ),
                  onChanged: (String name){
                    getStudentName(name);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Student ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2)
                      )
                  ),
                  onChanged: (String id){
                    getStudentID(id);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Study Program",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2)
                      )
                  ),
                  onChanged: (String programID){
                    getStudyProgramID(programID);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "GPA",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2)
                      )
                  ),
                  onChanged: (String gpa){
                    getStudentGPA(gpa);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: (){
                      createData();
                    },
                    color: Colors.green,
                    child: Text("Create"),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      readData();
                    },
                    color: Colors.blue,
                    child: Text("Read"),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      updateData();
                    },
                    color: Colors.orange,
                    child: Text("Update"),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      deleteData();
                    },
                    color: Colors.red,
                    child: Text("Delete"),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("MyStudent").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index){
                            DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: Card(
                                child: Column(
                                  children: [
                                    Text(documentSnapshot["studentName"]),
                                    Text(documentSnapshot["studentID"]),
                                    Text(documentSnapshot["studyProgramID"]),
                                    Text(documentSnapshot["studentGPA"].toString()),
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    }else{
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              )
            ],
          ),
        ) ,
      )
    );
  }
}