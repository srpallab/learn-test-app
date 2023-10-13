import 'package:get/get.dart';

import '../controllers/audio_record_and_play_controller.dart';

class AudioRecordAndPlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioRecordAndPlayController>(
      () => AudioRecordAndPlayController(),
    );
  }
}
