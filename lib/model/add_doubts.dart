import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_your_tutor/constants/constants.dart';
import 'package:find_your_tutor/constants/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? user;

class AddDoubts extends StatefulWidget {
  const AddDoubts({Key? key}) : super(key: key);

  @override
  _AddDoubtsState createState() => _AddDoubtsState();
}

class _AddDoubtsState extends State<AddDoubts> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> getUser() async {
    user = await _auth.currentUser;

  }
  DocumentReference currentuser;
  CollectionReference doubts = FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection("doubts");
  FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid).get().then((value) {
        currentuser = value;
  });


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
                  doubts.add({"name":currentuser.})
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
