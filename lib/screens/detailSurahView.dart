import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran/data/models/detail_surah.dart';
import 'package:alquran/data/models/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsurahView extends StatelessWidget {
  const DetailsurahView({super.key});

  @override
  Widget build(BuildContext context) {
    final Surah surah = Get.arguments;
    const String title = "Detail Surah";
    String id = surah.number.toString();
    Future<DetailSurah> getAllDetailSurah() async {
      Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
      print(url);
      var res = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      return DetailSurah.fromJson(data);
    }

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(184, 241, 6, 233),
          title: const Text(title, style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
            color: Colors.white,
            Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "${surah?.name?.transliteration?.id?.toLowerCase() ?? '-'}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${surah?.name?.translation?.id}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${surah?.numberOfVerses ?? '-'} Ayat | ${surah.revelation?.id}",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<DetailSurah>(
              future: getAllDetailSurah(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return Text("Tidak ada data");
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.verses!.length ?? 0,
                  itemBuilder: (context, index) {
                    if (snapshot?.data?.verses?.length == 0) {
                      return SizedBox();
                    }
                    Verse? ayat = snapshot?.data?.verses![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Text("${ayat?.number?.inSurah}"),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${ayat?.text?.arab}",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${ayat?.text?.transliteration?.en}",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        
                        Text(
                          "${ayat?.translation?.id}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                         SizedBox(
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
      ),
    );
  }
}
