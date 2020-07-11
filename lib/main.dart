import 'package:flutter/material.dart';
import 'package:login_01/screens/login-screen.dart';
import 'package:login_01/screens/routes/routes.dart';
import 'package:login_01/screens/splash-screen.dart';

void main() {
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: Colors.grey.shade300,
        scaffoldBackgroundColor: Colors.grey.shade300,
        dialogBackgroundColor: Colors.grey.shade300,
      ),
      home: SplashScreen(),
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
    );
  }
}
