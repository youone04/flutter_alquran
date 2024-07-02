import 'package:alquran/constants/color.dart';
import 'package:alquran/screens/detailSurahView.dart';
import 'package:alquran/screens/lastRead.dart';
import 'package:alquran/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:alquran/data/models/surah.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);
    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () => Get.to(SearchViews()),
                icon: Icon(Icons.search))
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //agar rata kiri
              children: [
                Text(
                  "Assalamu'alikum",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [appPurpleLight2, appPurpleLight1]),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      //biar bisa di klik
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => Get.to(LastReadView()),
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
                                  child: Image.asset(
                                      "assets/images/alquran.png",
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        color: appWhite, fontSize: 20),
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
                TabBar(
                  indicatorColor: appPurpleDark,
                  labelColor: Get.isDarkMode ? appWhite : appPurpleDark,
                  unselectedLabelColor: Colors.grey,
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
                        future: getAllSurah(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Text("Tidak ada data");
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                onTap: () => Get.to(() => DetailsurahView(),
                                    arguments: surah),
                                leading: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      Get.isDarkMode ? 
                                      "assets/images/diagonal_dark.png":
                                      "assets/images/diagonal_light.png"),
                                  )),
                                  child: Center(
                                    child: Text(
                                      "${surah.number}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Get.isDarkMode? appWhite : appPurpleDark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "${surah.name?.transliteration?.id ?? '-'}",
                                  style: TextStyle(
                                    color: Get.isDarkMode ? appWhite : appPurpleDark,
                                  ),
                                ),
                                subtitle: Text(
                                  "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? '-'}",
                                ),
                                trailing: Text(
                                  "${surah.name?.short ?? '-'}",
                                  style: TextStyle(
                                    color: Get.isDarkMode ? appWhite : appPurpleDark,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {},
                            leading: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(Get.isDarkMode ? 
                                      "assets/images/diagonal_dark.png":
                                      "assets/images/diagonal_light.png"),
                              )),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: appPurpleDark,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            title: Text(
                              "Juz ${index + 1}",
                              style: TextStyle(
                                color: appPurpleDark,
                              ),
                            ),
                          );
                        },
                      ),
                      Center(child: Text("Page 3"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
