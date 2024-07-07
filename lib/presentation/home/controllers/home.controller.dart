import 'package:alquran/constants/color.dart';
import 'package:alquran/data/models/juz.dart';
import 'package:alquran/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  List<Surah> allSurah = [];
  RxBool isDark = false.obs;

  void changeThemeMode() async {
    //change theme
    Get.isDarkMode ? Get.changeTheme(themeLight) : Get.changeTheme(themeDark);
    //change obx
    isDark.toggle();
    final box = GetStorage();
    if (Get.isDarkMode) {
      //dark ke light
      box.remove("themeDark");
    } else {
      box.write("themeDark", true);
    }
  }

  //surah
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);
    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data == null || data.isEmpty) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      return allSurah;
    }
  }

  //juz
  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];
    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse('https://api.quran.gading.dev/juz/$i');
      var res = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      Juz myJuzz = Juz.fromJson(data);
      // print(myJuzz);
      allJuz.add(myJuzz);
    }
    return allJuz;
  }
}
