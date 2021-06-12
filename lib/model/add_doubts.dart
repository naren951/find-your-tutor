import 'package:find_your_tutor/constants/constants.dart';
import 'package:flutter/material.dart';

class AddDoubts extends StatefulWidget {
  const AddDoubts({Key? key}) : super(key: key);

  @override
  _AddDoubtsState createState() => _AddDoubtsState();
}

class _AddDoubtsState extends State<AddDoubts> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
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
                maxLines: 14,
                keyboardType: TextInputType.text,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: "Description",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
