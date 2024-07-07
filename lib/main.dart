import 'package:alquran/constants/color.dart';
import 'package:alquran/presentation/detail_juz/controllers/detail_juz.controller.dart';
import 'package:alquran/presentation/detail_surah/controller/detail_surah.controller.dart';
import 'package:alquran/presentation/home/controllers/home.controller.dart';
import 'package:alquran/presentation/home/home.screen.dart';
// import 'package:alquran/screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//https://www.youtube.com/watch?v=kVTpY_h8m78&list=PL7jdfftn7HKvWLVrADa7UX-A_6E3859Xi&index=24
//https://github.com/gadingnst/quran-api
void main() async {
  await GetStorage.init();
  final box = GetStorage();
  Get.put(HomeController());
  Get.put(DetailJuzController());
  Get.put(DetailSurahController());

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: box.read('themeDark') == null ? themeLight : themeDark,
      home: const HomeScreen(),
    ));
}



