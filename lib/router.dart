import 'package:find_your_tutor/screens/login_page.dart';
import 'package:find_your_tutor/screens/welcome_page.dart';
import 'package:flutter/material.dart';

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
          builder: (_) => LoginScreen(),
        );
      default:
        return null!;
    }
  }
}
