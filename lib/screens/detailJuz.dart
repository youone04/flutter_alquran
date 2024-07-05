import 'package:alquran/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailjuz extends StatelessWidget {
  const Detailjuz({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeLight,
      home: const Detailjuz(),
    );
  }
}

class DetailjuzView extends StatefulWidget {
  const DetailjuzView({super.key});

  @override
  State<DetailjuzView> createState() => _DetailJuzState();
}

class _DetailJuzState extends State<DetailjuzView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Juz", style: TextStyle(color: Colors.white)),
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
        body: const Center(child: Text("Detail Juz")),
    );
  }
}
