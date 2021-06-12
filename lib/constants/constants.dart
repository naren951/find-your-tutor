import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  fillColor: Colors.yellow,
  hintStyle: TextStyle(
    fontSize: 15,
    //fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
