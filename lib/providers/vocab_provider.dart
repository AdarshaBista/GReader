import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:greader/models/section.dart';
import 'package:greader/models/vocabulary.dart';

class VocabProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Vocabulary> vocabs = [];
  final String _url =
      "https://gist.githubusercontent.com/AdarshaBista/2a6bc4831a3cb6732bb7c517136452be/raw/791ed37187e760d6558e0ade74e1287425d7b7c2/words.json";

  Future<void> fetchVocabs() async {
    setLoading(true);

    vocabs.clear();
    final http.Response response = await http.get(_url);
    final List<dynamic> responseData = jsonDecode(response.body);
    parseVocabs(responseData);

    setLoading(false);
  }

  Future<void> parseVocabs(List<dynamic> responseData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      for (int i = 0; i < responseData.length; ++i) {
        final String vocabTitle = "List ${i + 1}";
        List<Section> sections = [];

        responseData[i].forEach((String key, dynamic value) => sections.add(Section(key, List<String>.from(value))));
        vocabs.add(Vocabulary(vocabTitle, sections, DifficultyLevel.values[prefs.getInt(vocabTitle) ?? 1]));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> setDifficulty(DifficultyLevel level, String title) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(title, level.index);

    int index = vocabs.indexWhere((vocab) => vocab.title == title);
    vocabs[index].difficultyLevel = level;

    notifyListeners();
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
