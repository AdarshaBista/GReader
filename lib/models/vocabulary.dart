import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:greader/models/section.dart';

class Vocabulary {
  final String title;
  final List<Section> sections;

  Vocabulary({
    @required this.title,
    @required this.sections,
  })  : assert(title != null),
        assert(sections != null);

  Vocabulary copyWith({
    String title,
    List<Section> sections,
  }) {
    return Vocabulary(
      title: title ?? this.title,
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'sections': List<dynamic>.from(sections.map((x) => x.toMap())),
    };
  }

  static Vocabulary fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Vocabulary(
      title: map['title'],
      sections: List<Section>.from(map['sections']
          ?.map((x) => Section.fromMap(x as Map<String, dynamic>))),
    );
  }

  String toJson() => json.encode(toMap());

  static Vocabulary fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Vocabulary(title: $title, sections: $sections)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Vocabulary &&
        o.title == title &&
        listEquals(o.sections, sections);
  }

  @override
  int get hashCode => title.hashCode ^ sections.hashCode;
}
