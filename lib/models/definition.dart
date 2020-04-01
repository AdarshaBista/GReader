import 'dart:convert';

import 'package:meta/meta.dart';

class Definition {
  final String type;
  final String definition;
  final String example;
  final String imageUrl;

  Definition({
    @required this.type,
    @required this.definition,
    this.example,
    this.imageUrl,
  })  : assert(type != null),
        assert(definition != null);

  Definition copyWith({
    String type,
    String definition,
    String example,
    String imageUrl,
  }) {
    return Definition(
      type: type ?? this.type,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'definition': definition,
      'example': example,
      'image_url': imageUrl,
    };
  }

  static Definition fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Definition(
      type: map['type'],
      definition: map['definition'],
      example: map['example'],
      imageUrl: map['image_url'],
    );
  }

  String toJson() => json.encode(toMap());

  static Definition fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Definition(type: $type, definition: $definition, example: $example, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Definition &&
        o.type == type &&
        o.definition == definition &&
        o.example == example &&
        o.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        definition.hashCode ^
        example.hashCode ^
        imageUrl.hashCode;
  }
}
