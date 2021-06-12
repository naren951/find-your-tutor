import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:find_your_tutor/screens/welcome_page.dart';
import 'doubt_card.dart';
class Doubts extends StatefulWidget {
  const Doubts({Key? key}) : super(key: key);

  @override
  _DoubtsState createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
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
