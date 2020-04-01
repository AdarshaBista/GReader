import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:greader/secrets.dart';
import 'package:http/http.dart' as http;

import 'package:greader/services/tts_service.dart';

import 'package:greader/models/section.dart';
import 'package:greader/models/vocabulary.dart';
import 'package:greader/models/word_detail.dart';

class VocabProvider extends ChangeNotifier {
  final TtsService ttsService = TtsService();

  bool isLoading = false;
  bool isPlaying = false;

  List<Vocabulary> _vocabs = [];
  List<Vocabulary> get vocabs => _vocabs;

  void play(Vocabulary vocab) {
    int index = _vocabs.indexOf(vocab);
    ttsService.play(_stringify(index));
    isPlaying = true;
    notifyListeners();

    ttsService.onComplete(() {
      isPlaying = false;
      notifyListeners();
    });
  }

  void stop() {
    ttsService.stop();
    isPlaying = false;
    notifyListeners();
  }

  String _stringify(int index) {
    final Vocabulary vocab = _vocabs[index];
    String str = '';
    str += '${vocab.title}. ';
    for (Section s in vocab.sections) {
      str += 'Family: ${s.title}. ';
      for (String word in s.words) str += '$word. ';
    }

    return str;
  }

  Future<void> fetchVocabs() async {
    _setLoading(true);

    try {
      final http.Response response = await http.get(
        'https://raw.githubusercontent.com/AdarshaBista/GReader/master/api/vocabs.json',
      );
      final List<dynamic> vocabListJson = jsonDecode(response.body);

      _vocabs = vocabListJson
          .map((v) => Vocabulary.fromMap(v as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
    }

    _setLoading(false);
  }

  Future<WordDetail> fetchMeaning(String word) async {
    try {
      // Remove spaces in some words
      final String query = word.split(' ').first;
      final http.Response response = await http.get(
        Uri.encodeFull('https://owlbot.info/api/v4/dictionary/$query'),
        headers: {
          'Authorization': 'Token $OWLBOT_TOKEN',
        },
      );

      final WordDetail wordDetail = WordDetail.fromJson(response.body);
      return wordDetail;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
