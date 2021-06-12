import 'package:find_your_tutor/constants/constants.dart';
import 'package:find_your_tutor/constants/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? loggedInUser;

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void getCurrenUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        Navigator.pushNamed(context, STUDENT_HOME_PAGE);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrenUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Find Your Tutor!")),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
              colour: Colors.white,
              text: "Login",
              onPressed: () => Navigator.pushNamed(context, LOGIN_SCREEN),
            ),
            RoundedButton(
                colour: Colors.white,
                text: "Register",
                onPressed: () =>
                    Navigator.pushNamed(context, REGISTRATION_SCREEN)),
          ],
        ),
      ),
    );
  }
}
