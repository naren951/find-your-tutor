import 'package:find_your_tutor/constants/constants.dart';
import 'package:find_your_tutor/constants/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _roleSelected = TextEditingController();
  String? roleSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15.0,
        title: Text("Registration Page"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        opacity: 0.4,
        //color: Colors.white,
        progressIndicator: CircularProgressIndicator(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Register!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: "Enter your name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: _emailController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: "Enter your mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: "Enter your password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RoundedButton(
                    colour: Colors.white,
                    text: "Log In",
                    onPressed: () async {
                      setState(
                        () {
                          showSpinner = true;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> role = ["Student", "Tutor"];
