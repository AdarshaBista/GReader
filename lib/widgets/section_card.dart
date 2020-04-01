import 'package:flutter/material.dart';

import 'package:greader/utils/util.dart';

import 'package:greader/models/section.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/widgets/word_detail_sheet.dart';

class SectionCard extends StatelessWidget {
  final Section section;

  SectionCard(this.section);

  Widget _buildWordsList() => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: section.words.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _openWordDetails(context, section.words[index]),
            child: Text(
              section.words[index],
              style: mediumText.copyWith(
                  color: Util.isAntonym(section.words[index])
                      ? Colors.red
                      : Colors.black),
              textAlign: TextAlign.center,
            ),
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
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
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

  void _openWordDetails(BuildContext context, String word) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      elevation: 12.0,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: WordDetailSheet(
            word: word,
          ),
        );
      },
    );
  }
}
