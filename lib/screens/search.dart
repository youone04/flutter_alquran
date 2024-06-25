import 'package:alquran/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeLight,
      home: const SearchView(),
    );
  }
}

class SearchViews extends StatefulWidget {
  const SearchViews({super.key});

  @override
  State<SearchViews> createState() => _SearchState();
}

class _SearchState extends State<SearchViews> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Text("search"),
    );
  }
}
