import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:greader/providers/vocab_provider.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/pages/home_page.dart';

void main() => runApp(GReader());

class GReader extends StatefulWidget {
  @override
  _GReaderState createState() => _GReaderState();
}

class _GReaderState extends State<GReader> {
  final VocabProvider vocabProvider = VocabProvider();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await vocabProvider.fetchVocabs();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vocabProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GReader',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
          accentColor: accentColor,
        ),
        home: HomePage(),
      ),
    );
  }
}
