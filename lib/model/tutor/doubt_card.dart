import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoubtCard extends StatefulWidget {
  final String title, name, description, uid, tutor;
  DoubtCard(
      {required this.title,
      required this.name,
      required this.description,
      required this.uid,
      required this.tutor});
  @override
  _DoubtCardState createState() => _DoubtCardState();
}

class _DoubtCardState extends State<DoubtCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    CollectionReference response = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('response');
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        //padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.red.shade200,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.red.shade100, width: 3.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${widget.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Title: ${widget.title}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Description: ${widget.description}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Checkbox(
                activeColor: Colors.black,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });

                  if (value!) {
                    response.add({
                      'title': widget.title,
                      'tutor': widget.tutor,
                    });
                  } else {
                    response.get().then((value) => value.docs.remove(value));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
