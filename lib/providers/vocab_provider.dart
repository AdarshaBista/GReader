import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:greader/models/vocabulary.dart';

class VocabProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Vocabulary> _vocabs = [];
  List<Vocabulary> get vocabs => _vocabs;

  final String _url =
      "https://gist.githubusercontent.com/AdarshaBista/2a6bc4831a3cb6732bb7c517136452be/raw/5cc32544c47e37e74915623f30959c13d1a4f450/words.json";

  Future<void> fetchVocabs() async {
    _setLoading(true);

    try {
      final http.Response response = await http.get(_url);
      final List<dynamic> vocabListJson = jsonDecode(response.body);

      _vocabs = vocabListJson
          .map((v) => Vocabulary.fromMap(v as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
    }

    _setLoading(false);
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
