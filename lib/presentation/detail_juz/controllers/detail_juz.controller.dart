import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:alquran/data/models/juz.dart' as juz;

class DetailJuzController extends GetxController {
  final player = AudioPlayer();

  juz.Verses? lastVerse;

  //get detail surah
  //play audio
  void playAudio(juz.Verses? ayat) async {
    if (ayat?.audio?.primary != null) {
      if (lastVerse == null) {
        lastVerse = ayat;
      }
      //proses
      // Catching errors at load time
      try {
        lastVerse!.kondisiAudio = "stop";
        lastVerse = ayat;
        lastVerse!.kondisiAudio = "stop";
        update();
        await player.stop();
        await player.setUrl("${ayat!.audio?.primary}");
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
  void pauseAudio(juz.Verses? ayat) async {
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
  void resumeAudio(juz.Verses? ayat) async {
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
  void stopAudio(juz.Verses? ayat) async {
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
