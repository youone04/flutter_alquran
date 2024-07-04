import 'package:alquran/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeLight,
      home: const Page(),
    );
  }
}

class PageView extends StatefulWidget {
  const PageView({super.key});

  @override
  State<PageView> createState() => _PageState();
}

class _PageState extends State<PageView> {

  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeLight,
      title: "Last Read",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Last Read", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
            color: Colors.white,
            Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Text("Last Read"),
    )
  );
  }
}

