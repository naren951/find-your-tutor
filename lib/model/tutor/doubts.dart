import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'doubt_card.dart';
class Doubts extends StatefulWidget {
  const Doubts({Key? key}) : super(key: key);

  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
  List<DoubtCard> data=[];
  Future getData()async{
    List uids=[];
    await FirebaseFirestore.instance.collection('users').get().then((value){
      for(var user in value.docs){
        uids.add(user.id);
      }
    });
    for(var uid in uids) {
     await FirebaseFirestore.instance.collection('users').doc(uid).collection('doubts').get().then((value) {
        for(var doc in value.docs){
          // print(doc.data());
          data.add(DoubtCard(title:doc.data()['title'],name: doc.data()['name'],description: doc.data()['description']));
        }
        });
    }
    return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(getData());
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:getData(),builder: (BuildContext context,AsyncSnapshot snapshot){
      // print(snapshot.data);
  return ListView(
    children: snapshot.data as List<DoubtCard>,
  );
    });
  }
}
// return StreamBuilder<QuerySnapshot>(
// stream: FirebaseFirestore.instance.collection('users').snapshots(),
// builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
// List<DoubtCard> doubts=[];
// if(!snapshot.hasData){
// return CircularProgressIndicator(
// backgroundColor: Colors.blue,
// );
// }
// final userList;
//
// snapshot.data!.docs.forEach((user) {
// // print(user);
// // user.collection('doubts').docs.forEach((doubt){
// //   print(doubt['name']);
// //   print(doubt['descrioption']);
// });
// // print(userList[0].data());
// return ListView(
// children: [
// ],
// );
// }
// );