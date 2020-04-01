import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:greader/models/definition.dart';

class WordDetail {
  final String word;
  final String pronounciation;
  final List<Definition> definitions;

  WordDetail({
    @required this.word,
    @required this.pronounciation,
    @required this.definitions,
  })  : assert(word != null),
        assert(pronounciation != null),
        assert(definitions != null);

  WordDetail copyWith({
    String word,
    String pronounciation,
    List<Definition> definitions,
  }) {
    return WordDetail(
      word: word ?? this.word,
      pronounciation: pronounciation ?? this.pronounciation,
      definitions: definitions ?? this.definitions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'pronounciation': pronounciation,
      'definitions': List<dynamic>.from(definitions.map((x) => x.toMap())),
    };
  }

  static WordDetail fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WordDetail(
      word: map['word'],
      pronounciation: map['pronounciation'],
      definitions: List<Definition>.from(
          map['definitions']?.map((x) => Definition.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static WordDetail fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'WordDetail(word: $word, pronounciation: $pronounciation, definitions: $definitions)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WordDetail &&
        o.word == word &&
        o.pronounciation == pronounciation &&
        listEquals(o.definitions, definitions);
  }

  @override
  int get hashCode =>
      word.hashCode ^ pronounciation.hashCode ^ definitions.hashCode;
}
