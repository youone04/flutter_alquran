import 'package:alquran/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeLight,
      home: const LastRead(),
    );
  }
}

class LastReadView extends StatefulWidget {
  const LastReadView({super.key});

  @override
  State<LastReadView> createState() => _LastState();
}

class _LastState extends State<LastReadView> {

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
