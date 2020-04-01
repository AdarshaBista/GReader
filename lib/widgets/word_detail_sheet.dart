import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:greader/providers/vocab_provider.dart';

import 'package:greader/models/word_detail.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/widgets/loading_indicator.dart';
import 'package:greader/widgets/word_detail_list.dart';

class WordDetailSheet extends StatefulWidget {
  final String word;

  const WordDetailSheet({
    @required this.word,
  }) : assert(word != null);

  @override
  _WordDetailSheetState createState() => _WordDetailSheetState();
}

class _WordDetailSheetState extends State<WordDetailSheet> {
  Future<WordDetail> wordDetailFuture;

  @override
  void initState() {
    super.initState();
    wordDetailFuture = Provider.of<VocabProvider>(
      context,
      listen: false,
    ).fetchMeaning(widget.word);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WordDetail>(
      future: wordDetailFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return WordDetailList(
            wordDetail: snapshot.data,
          );
        if (snapshot.hasError)
          Text(
            'Cannot get meaning!',
            style: largeText,
          );
        return const LoadingIndicator();
      },
    );
  }
}
