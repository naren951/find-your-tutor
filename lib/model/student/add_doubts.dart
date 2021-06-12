import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_your_tutor/constants/constants.dart';
import 'package:find_your_tutor/constants/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Map<String, dynamic>? currentuser;
User? testuser;

class AddDoubts extends StatefulWidget {
  const AddDoubts({Key? key}) : super(key: key);

  @override
  _AddDoubtsState createState() => _AddDoubtsState();
}

class _AddDoubtsState extends State<AddDoubts> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> getUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    testuser = _auth.currentUser;
    currentuser = await FirebaseFirestore.instance
        .collection('users')
        .doc(testuser!.uid)
        .get()
        .then((value) => value.data());
  }

  CollectionReference doubts = FirebaseFirestore.instance
      .collection('users')
      .doc(testuser?.uid)
      .collection("doubts");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: "Title",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 10,
                //expands: true,
                keyboardType: TextInputType.multiline,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: "Description",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                colour: Colors.white,
                text: "Post",
                onPressed: () async {
                  doubts.add({
                    "name": currentuser!['name'],
                    "title": _titleController.text.toString().trim(),
                    "description": _descriptionController.text.toString().trim()
                  });
                  _titleController.clear();
                  _descriptionController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
