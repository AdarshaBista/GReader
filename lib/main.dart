import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:greader/providers/vocab_provider.dart';

import 'package:greader/styles/styles.dart';
import 'package:greader/pages/home_page.dart';

// For Flutter Desktop Support. To be removed later
import 'dart:io';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

void main() {
  _setTargetPlatformForDesktop();
  runApp(GReader());
}

class GReader extends StatefulWidget {
  @override
  _GReaderState createState() => _GReaderState();
}

class _GReaderState extends State<GReader> {
  final VocabProvider vocabProvider = VocabProvider();

  @override
  void initState() {
    super.initState();
    vocabProvider.fetchVocabs();
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
