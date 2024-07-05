import 'package:alquran/constants/color.dart';
// import 'package:alquran/screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:alquran/screens/MyHomePage.dart';
import 'package:get/get.dart';
//https://www.youtube.com/watch?v=7AHXOEvK2i8&list=PL7jdfftn7HKvWLVrADa7UX-A_6E3859Xi&index=15
//https://github.com/gadingnst/quran-api
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      home: const MyHomePage(title: "Al-Quran Apps"),
    );
  }
}

