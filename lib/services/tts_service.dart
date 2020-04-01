import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  final String lang = 'en-US';

  // Audio cannot be played if language is not available
  bool _canPlay = false;
  bool get canPlay => _canPlay;

  TtsService() {
    setLang();
  }

  void setLang() async {
    _canPlay = await _tts.isLanguageAvailable(lang) as bool;
    if (_canPlay) _tts.setLanguage(lang);
  }

  void play(String msg) async {
    _tts.stop();
    _tts.setSpeechRate(0.4);
    _tts.speak(msg);
  }

  void stop() {
    _tts.stop();
  }

  void onComplete(Function handler) {
    _tts.setCompletionHandler(handler);
  }
}
