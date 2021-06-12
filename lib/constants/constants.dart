import 'package:flutter/material.dart';

const LOGIN_SCREEN = "/login_screen";
const REGISTRATION_SCREEN = "/registration_screen";
const STUDENT_HOME_PAGE = "/student_home";
const TUTOR_HOME_PAGE = "/tutor_home";

const kTextFieldDecoration = InputDecoration(
  fillColor: Colors.yellow,
  focusColor: Colors.black26,
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

const Color kCardColor1 = Colors.black26;
const Color kCardColor2 = Colors.blue;
const kNumberTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
const kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

const kLargeButtonTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
