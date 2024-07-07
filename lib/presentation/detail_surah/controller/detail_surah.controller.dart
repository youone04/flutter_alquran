import 'package:alquran/data/models/juz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran/data/models/detail_surah.dart' as detail;
import 'dart:convert';
import 'package:just_audio/just_audio.dart';

class DetailSurahController extends GetxController {
  // RxString kondisiAudio = "stop".obs;

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
  void playAudio(detail.Verse? ayat) async {
    if (ayat?.audio.primary != null) {
      //proses
      // Catching errors at load time
      try {
        await player.stop();
        await player.setUrl(ayat!.audio.primary );
        ayat.kondisiAudio = "playing";
        update();
        await player.play();
        ayat.kondisiAudio = "stop";
        update();
        await player.stop();
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

  //pause audio
  void pauseAudio(detail.Verse? ayat) async {
    try {
      await player.pause();
      ayat?.kondisiAudio = "pause";
      update();
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
  }

  //resume audio
  void resumeAudio(detail.Verse? ayat) async {
    try {
      ayat?.kondisiAudio = "playing";
      update();
      await player.play();
      ayat?.kondisiAudio = "stop";
      update();
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
  }

  //stop audio
  void stopAudio(detail.Verse? ayat) async{
    try {
      await player.stop();
      ayat?.kondisiAudio = "stop";
      update();
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
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
