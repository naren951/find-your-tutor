import 'package:find_your_tutor/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
