import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/audio_record_and_play_controller.dart';

class AudioRecordAndPlayView extends GetView<AudioRecordAndPlayController> {
  const AudioRecordAndPlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Record And Player'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.isPlaying.value)
                const Text("Recording in Progress"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    // onPressed: controller.isPlaying.value
                    //     ? controller.stopRecording
                    //     : controller.startRecording,
                    child: Text(
                      controller.isPlaying.value
                          ? 'Stop Recording'
                          : "Start Recording",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  if (!controller.isPlaying.value &&
                      controller.audioPath.value != '')
                    ElevatedButton(
                      onPressed: controller.isPlaying.value
                          ? controller.stopPlaying
                          : controller.startPlaying,
                      child: Text(
                        controller.isPlaying.value
                            ? "Stop Playing"
                            : 'Play Recording',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
