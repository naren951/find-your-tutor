import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'doubt_card.dart';
class Doubts extends StatefulWidget {
  const Doubts({Key? key}) : super(key: key);

  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
  List<DoubtCard> data=[];
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? tutorName;
  Future getData()async{
    List uids=[];
    await FirebaseFirestore.instance.collection('users').get().then((value){

      for(var user in value.docs){
        if(user.id!=_auth.currentUser!.uid)
          uids.add(user.id);
        else
          tutorName=user.data()['name'];
      }

      // print(uids);
    });
    for(var uid in uids) {
     await FirebaseFirestore.instance.collection('users').doc(uid).collection('doubts').get().then((value) {
       // data.clear();
        for(var doc in value.docs){
          // print(doc.data()['title']);
          data.add(DoubtCard(title:doc.data()['title'],name: doc.data()['name'],uid:doc.data()['uid'],description: doc.data()['description'],tutor:tutorName!));
        }
        // print(data);
        });
    }
    return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(getData());
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:getData(),builder: (BuildContext context,AsyncSnapshot snapshot){
      // print(snapshot.data);
      if(!snapshot.hasData){
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
          ),
        );
      }
  return ListView(
    children: snapshot.data as List<DoubtCard>,
  );
    });
  }
}
