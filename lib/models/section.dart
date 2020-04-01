import 'dart:convert';

import 'package:flutter/foundation.dart';

class Section {
  final String title;
  final List<String> words;

  Section({
    @required this.title,
    @required this.words,
  })  : assert(title != null),
        assert(words != null);

  Section copyWith({
    String title,
    List<String> words,
  }) {
    return Section(
      title: title ?? this.title,
      words: words ?? this.words,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'words': List<dynamic>.from(words.map((x) => x)),
    };
  }

  static Section fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Section(
      title: map['title'],
      words: List<String>.from(map['words']),
    );
  }

  String toJson() => json.encode(toMap());

  static Section fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Section(title: $title, words: $words)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Section && o.title == title && listEquals(o.words, words);
  }

  @override
  int get hashCode => title.hashCode ^ words.hashCode;
}
