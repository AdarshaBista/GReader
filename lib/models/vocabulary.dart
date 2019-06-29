import 'package:greader/models/section.dart';

enum DifficultyLevel { Hard, Medium, Easy }

class Vocabulary {
  final String title;
  final List<Section> sections;
  DifficultyLevel difficultyLevel;

  Vocabulary(this.title, this.sections, this.difficultyLevel);
}
