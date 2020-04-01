import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:greader/secrets.dart';
import 'package:http/http.dart' as http;

import 'package:greader/models/vocabulary.dart';
import 'package:greader/models/word_detail.dart';

class VocabProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Vocabulary> _vocabs = [];
  List<Vocabulary> get vocabs => _vocabs;

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
