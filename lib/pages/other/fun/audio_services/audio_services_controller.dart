import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/main.dart';
import 'package:flutter_learning/pages/other/fun/audio_services/audio_player_handler.dart';
import 'package:get/get.dart';

class AudioServicesController extends GetxController {
  late AudioPlayerHandler audioHandler;

  final myController = Get.find<MyAppController>();

  var textController = TextEditingController();

  var media = const MediaItem(
    id: 'hello',
    title: 'Hello',
    extras: <String, String>{'hello': "你好"},
    duration: Duration(seconds: 1),
  );

  @override
  void onInit() {
    audioHandler = myController.audioHandler;
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  playSound() {
    var media = MediaItem(
      id: 'tts',
      title: 'TTS',
      extras: <String, String>{'tts': textController.text},
      duration: const Duration(seconds: 1),
    );
    audioHandler.addMedia(media);
    audioHandler.play();
    // audioHandler.playMediaItem(media);
  }

  stopSound() {
    audioHandler.stop();
  }
}
