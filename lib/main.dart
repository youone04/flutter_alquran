import 'package:alquran/screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:alquran/screens/MyHomePage.dart';
// https://www.youtube.com/watch?v=5vAzF5vIJAE&list=PL7jdfftn7HKvWLVrADa7UX-A_6E3859Xi&index=3
//https://github.com/gadingnst/quran-api
void main() {
  runApp(const Introduction());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: const MyHomePage(title: 'Home View'),
    );
  }
}

