import 'package:alquran/constants/color.dart';
import 'package:alquran/presentation/detail_juz/controllers/detail_juz.controller.dart';
import 'package:alquran/presentation/home/controllers/home.controller.dart';
import 'package:alquran/presentation/home/home.screen.dart';
// import 'package:alquran/screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//https://www.youtube.com/watch?v=OlskR7gyYJM&list=PL7jdfftn7HKvWLVrADa7UX-A_6E3859Xi&index=20
//https://github.com/gadingnst/quran-api
void main() {
  // The HomeController is instantiated immediately
  Get.put(HomeController());
  Get.put(DetailJuzController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      home: const HomeScreen(),
    );
  }
}


