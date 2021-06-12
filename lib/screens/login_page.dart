import 'package:find_your_tutor/constants/constants.dart';
import 'package:find_your_tutor/constants/rounded_button.dart';
import 'package:find_your_tutor/model/resuable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showSpinner = false;
  String? roleSelected;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> userLogin(String email, String pass, String role) async {
    try {
      final newUser =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = newUser.user;
      if (user!.emailVerified) {
        setState(() {
          showSpinner = true;
        });
        Navigator.pushNamed(
            context, role == "Tutor" ? TUTOR_HOME_PAGE : STUDENT_HOME_PAGE);
        setState(() {
          showSpinner = false;
        });
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "Email not verified! Please verify your email address",
          ),
        );
      }
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Incorrect password",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15.0,
        title: Text("Login Page"),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          FontAwesomeIcons.signInAlt,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: ResuableCard(
                        onPress: () {
                          setState(() {
                            roleSelected = "Tutor";
                          });
                        },
                        colour:
                            roleSelected == "Tutor" ? kCardColor1 : kCardColor2,
                        cardChild: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Tutor",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ResuableCard(
                        onPress: () {
                          setState(() {
                            roleSelected = "Student";
                          });
                        },
                        colour: roleSelected == "Student"
                            ? kCardColor1
                            : kCardColor2,
                        cardChild: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Student",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    cursorColor: Colors.white,
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
                    cursorColor: Colors.white,
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
                      final email = _emailController.text.toString().trim();
                      final password =
                          _passwordController.text.toString().trim();

                      await userLogin(email, password, roleSelected!);
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
