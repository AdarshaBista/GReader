import 'package:flutter/material.dart';

import 'package:greader/models/vocabulary.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/styles/styles.dart' as prefix0;
import 'package:greader/widgets/section_card.dart';

class VocabPage extends StatelessWidget {
  final Vocabulary vocabulary;

  VocabPage(this.vocabulary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: prefix0.difficultyColors[vocabulary.difficultyLevel.index],
        title: Text(
          vocabulary.title,
          style: largeText,
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: vocabulary.sections.length,
        itemBuilder: (BuildContext context, int index) {
          return SectionCard(vocabulary.sections[index]);
        },
      ),
    );
  }
}
