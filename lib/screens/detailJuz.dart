import 'package:alquran/constants/color.dart';
import 'package:alquran/data/models/juz.dart' as juz;
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
  final juz.Juz detailJuz = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('JUZ ${detailJuz.juz}', 
          style: const TextStyle(color: Colors.white)),
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
        body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: detailJuz.verses?.length ?? 0,
          itemBuilder: (context, index) {
            if(detailJuz.verses == null || detailJuz.verses?.length == 0){
              return const Center(
                child: Text("Tidak ada data"),
              );

            }
            juz.Verses ayat = detailJuz.verses![index];
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
                                child: Center(child: Text("${ayat.number!.inSurah}")),
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
                        style: const TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${ayat.translation?.id}",
                        textAlign: TextAlign.justify,
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
