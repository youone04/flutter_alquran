import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran/data/models/detail_surah.dart' as detail;
import 'dart:convert';
import 'package:just_audio/just_audio.dart';

class DetailSurahController extends GetxController {
  //get detail surah
  final player = AudioPlayer();

  Future<detail.DetailSurah> getAllDetailSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    // print(url);
    var res = await http.get(url);
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];
    return detail.DetailSurah.fromJson(data);
  }

  //play audio
  void playAudio(String? url) async {
    if (url != null) {
      //proses
      // Catching errors at load time
      try {
        await player.setUrl(url);
        await player.play();
      } on PlayerException catch (e) {
        Get.defaultDialog(
            title: "Terjadi Kesalahan", middleText: "${e.message.toString()}");
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
            title: "Terjadi Kesalahan", middleText: "${e.message.toString()}");
      } catch (e) {
        // Fallback for all other errors
        Get.defaultDialog(
            title: "Terjadi Kesalahan",
            middleText: "Fallback for all other errors");
      }

      // Catching errors during playback (e.g. lost network connection)
      player.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace st) {
        if (e is PlatformException) {
          Get.defaultDialog(
              title: "Terjadi Kesalahan",
              middleText: "Tidak dapat memutar audio");
        } else {
          Get.defaultDialog(
              title: "Terjadi Kesalahan",
              middleText: "An error occurred ${e.toString()}");
        }
      });
    } else {
      Get.defaultDialog(
          title: "Terjadi Kesalahan", middleText: "URL Audio tidak valid");
    }
  }
  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
