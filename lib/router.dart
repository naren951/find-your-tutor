import 'package:find_your_tutor/screens/login_page.dart';
import 'package:find_your_tutor/screens/registration_page.dart';
import 'package:find_your_tutor/screens/student_home_page.dart';
import 'package:find_your_tutor/screens/tutor_home_page.dart';
import 'package:find_your_tutor/screens/welcome_page.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => WelcomePage(),
        );
      case LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case REGISTRATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => RegistrationScreen(),
        );
      case STUDENT_HOME_PAGE:
        return MaterialPageRoute(
          builder: (_) => StudentHomePage(),
        );
      case TUTOR_HOME_PAGE:
        return MaterialPageRoute(
          builder: (_) => TutorHomePage(),
        );
      default:
        return null!;
    }
  }
}
