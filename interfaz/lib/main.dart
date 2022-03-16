import 'package:flutter/material.dart';
import 'package:interfaz/routes/routes.dart';
import 'package:interfaz/screens/Login.dart';
import 'package:interfaz/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getApplicationRoutes(),
      home: SplashScreen(),
    );
  }
}
