import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_your_tutor/constants/constants.dart';
import 'package:find_your_tutor/constants/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _studyingController = TextEditingController();
  final _qualificationController = TextEditingController();
  String? roleSelected;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> registerUser(String email, String password,String name,String phoneno) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = await _auth.currentUser;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      }
      if (newUser != null) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: "Registered successfully",
          ),
        );
        users.doc(newUser.user!.uid).set({'uid':newUser.user!.uid,
          'name':name,'email':email,'phoneno':phoneno});
        Navigator.pushNamed(context, LOGIN_SCREEN);
        setState(() {
          showSpinner = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

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
                  CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage('images/download.png'),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Sign Up!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: "Enter your full name",
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
                    height: 30.0,
                  ),
                  TextField(
                    controller: _phoneController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: "Enter your phone number",
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
                  TextField(
                    controller: _confirmPassController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: "Confirm your password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  roleSelected == 'Tutor'
                      ? TextField(
                          controller: _qualificationController,
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                            labelText: "Qualification",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : TextField(
                          controller: _studyingController,
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                            labelText: "Studying in?",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: RoundedButton(
                      colour: Colors.white,
                      text: "Register!",
                      onPressed: () async {
                        final email = _emailController.text.toString().trim();
                        final password =
                            _passwordController.text.toString().trim();
                        final name=_nameController.text.toString().trim();
                        final phoneno=_phoneController.text.toString().trim();
                        // final confirm =
                        //      _confirmPassController.text.toString().trim();
                        if (_nameController.text.isNotEmpty ||
                            _emailController.text.isNotEmpty ||
                            _passwordController.text.isNotEmpty ||
                            _confirmPassController.text.isNotEmpty ||
                            _phoneController.text.isNotEmpty ||
                            _qualificationController.text.isNotEmpty ||
                            _studyingController.text.isNotEmpty) {
                          if (_confirmPassController.text.trim() !=
                              _passwordController.text.trim()) {
                            showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                message: "Please enter the correct password",
                              ),
                            );
                          } else {
                            registerUser(email, password,name,phoneno);
                            setState(
                              () {
                                showSpinner = true;
                              },
                            );
                          }
                        } else {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message: "Please fill in the details!",
                            ),
                          );
                        }
                      },
                    ),
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
