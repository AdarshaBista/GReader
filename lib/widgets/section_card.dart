import 'package:flutter/material.dart';

import 'package:greader/models/section.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/utils/util.dart';

class SectionCard extends StatelessWidget {
  final Section section;

  SectionCard(this.section);

  Widget _buildWordsList() => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: section.words.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            section.words[index],
            style: mediumText.copyWith(color: Util.isAntonym(section.words[index]) ? Colors.red : Colors.black),
            textAlign: TextAlign.center,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 30.0,
            color: Colors.black45,
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      color: Colors.white,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(
          section.title,
          style: smallText,
        ),
        children: <Widget>[
          _buildWordsList(),
        ],
      ),
    );
  }
}
