// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:convert';
import 'package:alquran/data/models/surah.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:alquran/main.dart';
import 'package:http/http.dart' as http;

void main() async{
  Uri url = Uri.parse('https://api.quran.gading.dev/surah');
  var res = await http.get(url);
 List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
 //print(data);

 //data dari api (raw data) -> Model (yang sudah disiapin)
 Surah surahAnnas = Surah.fromJson(data[113]);
 print(surahAnnas.toJson());
}
