import 'package:flutter/material.dart';

import 'package:greader/models/vocabulary.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/widgets/player_controls.dart';
import 'package:greader/pages/vocab_page.dart';

class VocabularyCard extends StatelessWidget {
  final Vocabulary vocabulary;

  VocabularyCard(this.vocabulary);

  Widget _buildCardHeader() => Container(
        width: double.infinity,
        height: 50.0,
        alignment: Alignment.center,
        color: primaryColor,
        child: Text(
          vocabulary.title,
          style: largeText,
          textAlign: TextAlign.center,
        ),
      );

  Widget _buildSectionsList() => Flexible(
        child: ListView.separated(
          padding: EdgeInsets.all(24.0),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: vocabulary.sections.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              vocabulary.sections[index].title,
              style: smallText,
              textAlign: TextAlign.center,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 30.0,
              color: Colors.black45,
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: vocabulary.title,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        color: Colors.white,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => VocabPage(vocabulary),
              ),
            );
          },
          child: Container(
            width: 240.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildCardHeader(),
                _buildSectionsList(),
                PlayerControls(vocabulary: vocabulary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
