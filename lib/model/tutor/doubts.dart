import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'doubt_card.dart';
class Doubts extends StatefulWidget {
  const Doubts({Key? key}) : super(key: key);

  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
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
        final userList = snapshot.data!.docs;
        for(var element in userList){
          final doubtslist=snapshot.data!.docs;
          for(var element in doubtslist){
            doubts.add(DoubtCard(title: element['title'], name: element['name'], description: element['description']));
          }
          doubts.add(DoubtCard(title: element['title'], name: element['name'], description: element['description']));
        }
        return ListView(
          children: [
          ],
        );
      }
    );
  }
}
