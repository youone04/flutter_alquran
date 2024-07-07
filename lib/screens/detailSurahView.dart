import 'package:alquran/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran/data/models/detail_surah.dart' as detail;
import 'package:alquran/data/models/surah.dart';
// import 'package:get/get_core/get_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:get/get.dart';

class DetailsurahView extends StatelessWidget {
  const DetailsurahView({super.key});

  @override
  Widget build(BuildContext context) {
    final Surah surah = Get?.arguments;
    const String title = "Detail Surah";
    String id = surah.number.toString();
    Future<detail.DetailSurah> getAllDetailSurah() async {
      Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
      // print(url);
      var res = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      return detail.DetailSurah.fromJson(data);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(color: Colors.white, Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
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
                    Text(
                      "Tafsir ${surah.name.transliteration?.id ?? '-'}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
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
          SizedBox(height: 20),
          FutureBuilder<detail.DetailSurah>(
            future: getAllDetailSurah(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(child: Text("Tidak ada data"),
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
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.bookmark_add_outlined)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.play_arrow)),
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
