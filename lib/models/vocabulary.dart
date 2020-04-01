import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:greader/models/section.dart';

class Vocabulary {
  final String title;
  final List<Section> sections;
  int difficultyLevel;

  Vocabulary({
    @required this.title,
    @required this.sections,
    @required this.difficultyLevel,
  })  : assert(title != null),
        assert(sections != null),
        assert(difficultyLevel != null);

  Vocabulary copyWith({
    String title,
    List<Section> sections,
    int difficultyLevel,
  }) {
    return Vocabulary(
      title: title ?? this.title,
      sections: sections ?? this.sections,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'sections': List<dynamic>.from(sections.map((x) => x.toMap())),
      'difficultyLevel': difficultyLevel,
    };
  }

  static Vocabulary fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Vocabulary(
      title: map['title'],
      sections: List<Section>.from(map['sections']
          ?.map((x) => Section.fromMap(x as Map<String, dynamic>))),
      difficultyLevel: map['difficultyLevel'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  static Vocabulary fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Vocabulary(title: $title, sections: $sections, difficultyLevel: $difficultyLevel)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Vocabulary &&
        o.title == title &&
        listEquals(o.sections, sections) &&
        o.difficultyLevel == difficultyLevel;
  }

  @override
  int get hashCode =>
      title.hashCode ^ sections.hashCode ^ difficultyLevel.hashCode;
}
