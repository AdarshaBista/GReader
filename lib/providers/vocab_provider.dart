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
      "https://gist.githubusercontent.com/AdarshaBista/2a6bc4831a3cb6732bb7c517136452be/raw/5cc32544c47e37e74915623f30959c13d1a4f450/words.json";

  Future<void> fetchVocabs() async {
    setLoading(true);
    vocabs.clear();

    try {
      final http.Response response = await http.get(_url);
      final List<dynamic> responseData = jsonDecode(response.body);
      await parseVocabs(responseData);
    } catch (e) {
      print(e);
    }

    setLoading(false);
  }

  Future<void> parseVocabs(List<dynamic> responseData) async {
    for (Map<String, dynamic> vocabJson in responseData) {
      vocabs.add(
        Vocabulary(
          title: vocabJson['title'] as String,
          difficultyLevel: DifficultyLevel.values[await getDifficulty(vocabJson['title'] as String)],
          sections: List<Section>.generate(
            (vocabJson['sections'] as List).length,
            (index) => Section.fromJson(vocabJson['sections'][index]),
          ),
        ),
      );
    }
  }

  Future<int> getDifficulty(String title) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(title) ?? 1;
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
