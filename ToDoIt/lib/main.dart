import 'package:app/constants.dart';
import 'package:app/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoIt- Align Yourself',
      theme: ThemeData(
        scaffoldBackgroundColor: ScaffoldBgColor,
        primaryColor: ThemeOrangeColor,
        appBarTheme: const AppBarTheme(backgroundColor: ThemeOrangeColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
