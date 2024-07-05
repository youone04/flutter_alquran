// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:convert';
import 'package:alquran/data/models/ayat.dart';
import 'package:alquran/data/models/detail_surah.dart';
import 'package:alquran/data/models/juz.dart';
import 'package:alquran/data/models/surah.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:alquran/main.dart';
import 'package:http/http.dart' as http;

void main() async{
  //surah
  // Uri url = Uri.parse('https://api.quran.gading.dev/surah/');
  // var res = await http.get(url);
  // List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
 //print(data);

 //data dari api (raw data) -> Model (yang sudah disiapin)
//  Surah surahAnnas = Surah.fromJson(data[113]);
//  print(surahAnnas.toJson());

 //detail surah
  // Uri url = Uri.parse('https://api.quran.gading.dev/surah/1');
  // var res = await http.get(url);
  // Map<String, dynamic> data =
  //         (json.decode(res.body) as Map<String, dynamic>)["data"];
  // DetailSurah hasil = DetailSurah.fromJson(data);

  // print(hasil);

  //ayat
  // Uri url = Uri.parse('https://api.quran.gading.dev/surah/108/1');
  // var res = await http.get(url);
  // Map<String, dynamic> data = json.decode(res.body)["data"];
  // // data tanpa key surah
  // Map<String ,dynamic>  dataToModel =  {
  //   "number" : data["number"],
  //   "meta" : data["meta"],
  //   "text" : data["text"],
  //   "translation" : data["translation"],
  //   "audio" : data["audio"],
  //   "tafsir" : data["tafsir"]
  // };

  // //convert Map to model
  // Ayat ayat = Ayat.fromJson(dataToModel);
  // print(ayat.tafsir.id.short);

  //juz
   List<Juz> allJuz = [];
    for (int i = 1; i <= 5; i++) {
      Uri url = Uri.parse('https://api.quran.gading.dev/juz/$i');
      var res = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];

      Juz myJuzz = Juz.fromJson(data);
      // print(myJuzz);
      // allJuz.add(data);
    }
}

