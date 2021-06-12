import 'package:find_your_tutor/constants/constants.dart';
import 'package:find_your_tutor/constants/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
              onPressed:()=>Navigator.pushNamed(context, LOGIN_SCREEN),
          ),

            RoundedButton(
                colour: Colors.white,
                text: "Register",
                onPressed: () =>Navigator.pushNamed(context, REGISTRATION_SCREEN)
            ),],
        ),
      ),
    );
  }
}
