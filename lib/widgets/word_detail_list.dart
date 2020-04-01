import 'package:flutter/material.dart';

import 'package:greader/models/word_detail.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/widgets/definition_card.dart';

class WordDetailList extends StatelessWidget {
  final WordDetail wordDetail;

  const WordDetailList({
    @required this.wordDetail,
  }) : assert(wordDetail != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Text(
              wordDetail.word,
              maxLines: 2,
              style: mediumText,
            ),
          ),
          const Divider(height: 16.0),
          ...wordDetail.definitions.map(
            (d) => DefinitionCard(
              definition: d,
            ),
          ),
        ],
      ),
    );
  }
}
