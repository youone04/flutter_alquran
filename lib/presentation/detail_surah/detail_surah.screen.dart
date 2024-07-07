import 'package:alquran/constants/color.dart';
import 'package:alquran/presentation/detail_surah/controller/detail_surah.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran/data/models/detail_surah.dart' as detail;
import 'package:alquran/data/models/surah.dart';

class DetailJSurahScreen extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Detail Surah", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(color: Colors.white, Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTap: () => Get.dialog(Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
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
                    Text(
                      "Tafsir ${surah.name.transliteration?.id ?? '-'}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${surah.tafsir?.id ?? "-"}",
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            )),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [appPurpleLight2, appPurpleLight1],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "${surah.name.transliteration?.id?.toUpperCase() ?? '-'}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appWhite),
                    ),
                    Text(
                      "${surah?.name?.translation?.id}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: appWhite),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${surah.numberOfVerses} Ayat | ${surah.revelation.id}",
                      style: const TextStyle(fontSize: 16, color: appWhite),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FutureBuilder<detail.DetailSurah>(
            future: controller.getAllDetailSurah(surah.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Tidak ada data"),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.verses.length,
                itemBuilder: (context, index) {
                  if (snapshot?.data?.verses?.length == 0) {
                    return const SizedBox();
                  }
                  detail.Verse? ayat = snapshot.data?.verses[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appPurpleLight2.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
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
                                child: Center(child: Text("${index + 1}")),
                              ),
                              Obx(
                                () => Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.bookmark_add_outlined),
                                    ),
                                    (controller.kondisiAudio.value == "stop")
                                        ? IconButton(
                                            onPressed: () {
                                              controller.playAudio(
                                                  ayat?.audio.primary);
                                            },
                                            icon: Icon(Icons.play_arrow),
                                          )
                                        : Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              (controller.kondisiAudio.value ==
                                                      "playing")
                                                  ? IconButton(
                                                      onPressed: () {
                                                        controller.pauseAudio();
                                                      },
                                                      icon: Icon(Icons.pause),
                                                    )
                                                  : IconButton(
                                                      onPressed: () {
                                                        controller.resumeAudio();
                                                      },
                                                      icon: Icon(Icons.play_arrow),
                                                    ),
                                              IconButton(
                                                onPressed: () {
                                                  controller.stopAudio();
                                                },
                                                icon: Icon(Icons.stop),
                                              )
                                            ],
                                          ),
                                  ],
                                ),
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
                          "${ayat?.text.arab}",
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${ayat?.text.transliteration.en}",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${ayat?.translation.id}",
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
              );
            },
          ),
        ],
      ),
    );
  }
}
