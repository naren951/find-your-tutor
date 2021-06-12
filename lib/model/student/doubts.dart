import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'doubt_card.dart';
Map<String, dynamic>? currentuser;
User? loggedInUser;
class Doubts extends StatefulWidget {

  const Doubts({Key? key}) : super(key: key);
  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
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
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('users').doc(loggedInUser!.uid).collection('doubts').snapshots(),
        builder: (context,snapshot){
          List<DoubtCard> doubts=[];
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
          final doubtslist = snapshot.data!.docs;
          for(var element in doubtslist){
            doubts.add(DoubtCard(title: element['title'], name: element['name'], description: element['description']));
          }

          return ListView(
            children: doubts,
          );
        });
  }
}
