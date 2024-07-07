import 'package:alquran/presentation/detail_juz/controllers/detail_juz.controller.dart';
// import 'dart:ffi';
import 'package:alquran/constants/color.dart';
import 'package:alquran/data/models/juz.dart' as juz;
import 'package:alquran/data/models/surah.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailJuzScreen extends GetView<DetailJuzController> {
  final juz.Juz detailJuz = Get.arguments["juz"];
  final List<Surah> allSurahInThisJuz = Get.arguments["surah"];

  @override
  Widget build(BuildContext context) {
  //  List<Map<String, dynamic>> updatedVerses = [
  //   for (var verse in detailJuz)
  //     {
  //       ...verse,
  //       "name": 'surahName',
  //     }
  // ];

  // print(updatedVerses);

    return Scaffold(
      appBar: AppBar(
        title: Text('JUZ - ${detailJuz.juz}',
            style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(color: Colors.white, Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: detailJuz.verses?.length ?? 0,
        itemBuilder: (context, index) {
          if (detailJuz.verses == null || detailJuz.verses?.length == 0) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }
          juz.Verses ayat = detailJuz.verses![index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if(ayat.number?.inSurah == 1)
              GestureDetector(
              onTap: () => Get.dialog(Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: Get.isDarkMode
                    ? appPurpleLight2.withOpacity(0.3)
                    : appWhite,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Tafsir Surah Ayat 1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${ayat.tafsir?.id?.short ?? "-"}",
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            )),
            child: Container(
              width: Get.width,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [appPurpleLight2, appPurpleLight1],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                     Text(
                      "﻿بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appWhite),
                    ),
                    Text(
                      "Bismillaahir Rahmaanir Raheem",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: appWhite),
                    ),
                    SizedBox(height: 10),
                    
                  ],
                ),
              ),
            ),
          ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appPurpleLight2.withOpacity(0.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Get.isDarkMode
                                    ? "assets/images/diagonal_dark.png"
                                    : "assets/images/diagonal_light.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child:
                                Center(child: Text("${ayat.number!.inSurah}")),
                          ),
                          // Text("${allSurahInThisJuz[0]?.name?.transliteration?.id ?? '-'}",
                          // style: const TextStyle(
                          //   fontStyle: FontStyle.italic,
                          //   fontSize: 16
                          // ),
                          // )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_add_outlined)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.play_arrow)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${ayat.text?.arab}",
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${ayat.text?.transliteration?.en}",
                textAlign: TextAlign.end,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "${ayat.translation?.id}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        },
      ),
    );
  }
}
