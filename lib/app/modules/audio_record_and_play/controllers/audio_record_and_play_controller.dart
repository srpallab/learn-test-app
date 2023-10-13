import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:record/record.dart';

class AudioRecordAndPlayController extends GetxController {
  late Record recorder;
  late AudioPlayer audioPlayer;
  final RxBool isPlaying = false.obs;
  final RxString audioPath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    recorder = Record();
    audioPlayer = AudioPlayer();
  }

  Future<void> startRecording() async {
    try {
      if (await recorder.hasPermission()) {
        recorder.start();
        isPlaying.value = true;
      }
    } catch (error) {
      log("Error Starting Record: $error");
    }
  }

  Future<void> stopRecording() async {
    try {
      if (await recorder.hasPermission()) {
        audioPath.value = (await recorder.stop())!;
        isPlaying.value = false;
      }
    } catch (error) {
      log("Error Stopping Record: $error");
    }
  }

  Future<void> startPlaying() async {
    try {
      var source = UrlSource(audioPath.value);
      await audioPlayer.play(source);
    } catch (error) {
      log("Error Starting Record: $error");
    }
  }

  Future<void> stopPlaying() async {
    try {} catch (error) {
      log("Error Starting Record: $error");
    }
  }

  @override
  void onClose() {
    recorder.dispose();
    audioPlayer.dispose();
    super.onClose();
  }
}
