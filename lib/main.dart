import 'package:find_your_tutor/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    router: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.router}) : super(key: key);
  final AppRouter? router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router!.generateRoute,
    );
  }
}
