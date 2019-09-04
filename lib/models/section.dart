import 'package:flutter/material.dart';

class Section {
  final String title;
  final List<String> words;

  Section({
    @required this.title,
    @required this.words,
  })  : assert(title != null),
        assert(words != null);

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
      words: List<String>.from(json['words']),
    );
  }
}
