import 'package:alquran/constants/color.dart';
import 'package:alquran/data/models/surah.dart';
import 'package:alquran/presentation/detail_juz/controllers/detail_juz.controller.dart';
import 'package:alquran/presentation/detail_juz/detail_juz.screen.dart';
import 'package:alquran/presentation/detail_surah/controller/detail_surah.controller.dart';
import 'package:alquran/presentation/detail_surah/detail_surah.screen.dart';
import 'package:alquran/screens/lastRead.dart';
import 'package:alquran/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:alquran/data/models/juz.dart' as juz;
import 'package:get/get.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Al-Quran Apps",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.to(const SearchViews()), icon: const Icon(Icons.search))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            //agar tampilan vertikal
            crossAxisAlignment: CrossAxisAlignment.start, //agar rata kiri
            children: [
              const Text(
                "Assalamu'alikum",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [appPurpleLight2, appPurpleLight1]),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    //biar bisa di klik
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.to(const LastReadView()),
                    child: Container(
                      height: 150,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -50, // agar berada dibawah
                            right: 0, // agar berada disebelah kanan
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset("assets/images/alquran.png",
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.menu_book_rounded,
                                        color: appWhite),
                                    SizedBox(width: 10),
                                    Text(
                                      "Terakhir dibaca",
                                      style: TextStyle(color: appWhite),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "Alfa Tihah",
                                  style:
                                      TextStyle(color: appWhite, fontSize: 20),
                                ),
                                Text(
                                  "Juz 1 | Ayat 5",
                                  style: TextStyle(
                                    color: appWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const TabBar(
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  Tab(
                    text: "Juz",
                  ),
                  Tab(
                    text: "Bookmark",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Text("Tidak ada data");
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return ListTile(
                              onTap: () => {
                                      Get.put(DetailSurahController()),
                                      Get.to(() => DetailJSurahScreen(),
                                  arguments: surah)

                              },
                              leading: Obx(
                                () => Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(controller.isDark.isTrue
                                        ? "assets/images/diagonal_dark.png"
                                        : "assets/images/diagonal_light.png"),
                                  )),
                                  child: Center(
                                    child: Text(
                                      "${surah.number}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                "${surah.name?.transliteration?.id ?? '-'}",
                              ),
                              subtitle: Text(
                                "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? '-'}",
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              trailing: Text(
                                "${surah.name?.short ?? '-'}",
                              ),
                            );
                          },
                        );
                      },
                    ),
                    FutureBuilder<List<juz.Juz>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Text("Tidak ada data");
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            juz.Juz detailJuz = snapshot.data![index];
                           String nameStart =  detailJuz.juzStartInfo?.split(" - ").first ?? "";
                           String nameEnd =  detailJuz.juzEndInfo?.split(" - ").first ?? "";
                           List<Surah> rawAllSurahInJuz = [];
                           List<Surah> allSurahInJuz = [];
                           for (Surah item in controller.allSurah) {
                            rawAllSurahInJuz.add(item);
                             if(item.name.transliteration!.id == nameEnd){
                              break;
                             }
                           }

                           for (Surah item in rawAllSurahInJuz.reversed.toList()) {
                            allSurahInJuz.add(item);
                             if(item.name.transliteration!.id == nameStart){
                              break;
                             }
                           }
                            return ListTile(
                              onTap: () => {
                              Get.put(DetailJuzController()),
                              Get.to(() => DetailJuzScreen(),
                              arguments: {
                               "juz" : detailJuz,
                               "surah" : allSurahInJuz.reversed.toList(),
                                })
                              },
                              leading: Obx(
                                () => Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(controller.isDark.isTrue
                                        ? "assets/images/diagonal_dark.png"
                                        : "assets/images/diagonal_light.png"),
                                  )),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                "Juz ${index + 1}",
                              ),
                              isThreeLine: true,//karena ada 3 line
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Mulai dari ${detailJuz.juzStartInfo}",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                   Text(
                                    "Sampa i ${detailJuz.juzEndInfo}",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const Center(child: Text("Page 3"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.changeThemeMode(),
        child: Obx(
          () => Icon(
            Icons.color_lens,
            color:controller.isDark.isTrue ? appPurpleDark : appWhite,
          ),
        ),
      ),
    );
  }
}
