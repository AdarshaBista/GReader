import 'package:flutter/material.dart';

import 'package:greader/models/vocabulary.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/widgets/section_card.dart';
import 'package:greader/widgets/player_controls.dart';

class VocabPage extends StatelessWidget {
  final Vocabulary vocabulary;

  VocabPage(this.vocabulary);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: vocabulary.title,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: difficultyColors[vocabulary.difficultyLevel.index],
          title: Text(
            vocabulary.title,
            style: largeText,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: PlayerControls(),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: vocabulary.sections.length,
          itemBuilder: (BuildContext context, int index) {
            return SectionCard(vocabulary.sections[index]);
          },
        ),
      ),
    );
  }
}
