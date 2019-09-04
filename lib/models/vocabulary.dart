import 'package:flutter/material.dart';

import 'package:greader/models/section.dart';

enum DifficultyLevel { Hard, Medium, Easy }

class Vocabulary {
  final String title;
  final List<Section> sections;
  DifficultyLevel difficultyLevel;

  Vocabulary({
    @required this.title,
    @required this.sections,
    this.difficultyLevel = DifficultyLevel.Medium,
  })  : assert(title != null),
        assert(sections != null),
        assert(difficultyLevel != null);
}
