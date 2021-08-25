import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = Firestore.instance.collection('users');   // to get data  step1

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  List<dynamic> user = [];

  @override
  void initState() {      //step2
    getUsers();
    //getUserById();
    super.initState();
  }


  getUsers()  async    //step3
  {
      final QuerySnapshot snapshot = await usersRef.getDocuments();

      setState(() {
        user = snapshot.documents;
      });

        // snapshot.documents.forEach((DocumentSnapshot doc){
        //   // print(doc.data);
        //   // print(doc.documentID);
        //   // print(doc.exists);
        // }
        // );
  }
//orderBy("postsCount",descending: true).
  // getUserById() async   //step3
  // {
  //   final String id = "M8diORjwgnnits8DU14G";
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //           print(doc.data);
  //           print(doc.documentID);
  //           print(doc.exists);
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context,isAppTitle: true),
      body: Container(
        child: ListView(
          children: user.map((user)=>Text(user['username'])).toList(),
        ),
      ),
    );
  }
}
