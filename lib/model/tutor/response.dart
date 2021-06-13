import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_your_tutor/model/tutor/response_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
User? loggedInUser;
class Response extends StatefulWidget {
  const Response({Key? key}) : super(key: key);

  @override
  _ResponseState createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  void getUser(){
    loggedInUser = _auth.currentUser;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('users').doc(loggedInUser?.uid).collection('response').snapshots(),
        builder: (context,snapshot){
          List<ResponseCard> doubts=[];
          if(!snapshot.hasData){
            return CircularProgressIndicator(
              backgroundColor: Colors.blue,
            );
          }
          if(snapshot.hasError){
            return CircularProgressIndicator(
              backgroundColor: Colors.blue,
            );
          }
          final responselist = snapshot.data!.docs;
          for(var element in responselist){
            doubts.add(ResponseCard(title: element['title'], tutor: element['tutor']));
          }

          return ListView(
            children: doubts,
          );
        });
  }
}
