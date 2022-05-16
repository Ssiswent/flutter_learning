import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  final _tts = Tts();
  bool _finished = false;

  @override
  Future<void> play() async {
    await _tts.speak('${mediaItem.value!.extras!["tts"]}');
  }

  addMedia(MediaItem media) {
    mediaItem.add(media);
  }

  @override
  Future<void> playMediaItem(MediaItem mediaItem) async {
    // 循环播放10次
    for (var n = 1; !_finished && n <= 10; n++) {
      _tts.speak('${mediaItem.extras!["tts"]}');
      await Future.delayed(const Duration(seconds: 2));
    }
    // await _tts.speak('${mediaItem.extras!["tts"]}');
  }

  @override
  Future<void> stop() async {
    // Stop speaking the numbers
    _finished = true;
  }
}

/// A wrapper around FlutterTts that makes it easier to wait for speech to
/// complete.
class Tts {
  final FlutterTts _flutterTts = FlutterTts();
  Completer<void>? _speechCompleter;
  bool _interruptRequested = false;
  bool _playing = false;

  Tts() {
    _flutterTts.setCompletionHandler(() {
      _speechCompleter?.complete();
    });
  }

  bool get playing => _playing;

  Future<void> speak(String text) async {
    _playing = true;
    if (!_interruptRequested) {
      _speechCompleter = Completer();
      await _flutterTts.speak(text);
      await _speechCompleter!.future;
      _speechCompleter = null;
    }
    _playing = false;
    if (_interruptRequested) {
      _interruptRequested = false;
      throw TtsInterruptedException();
    }
  }

  Future<void> stop() async {
    if (_playing) {
      await _flutterTts.stop();
      _speechCompleter?.complete();
    }
  }

  void interrupt() {
    if (_playing) {
      _interruptRequested = true;
      stop();
    }
  }
}

class TtsInterruptedException {}
