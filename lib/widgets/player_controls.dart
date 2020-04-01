import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:greader/providers/vocab_provider.dart';

import 'package:greader/models/vocabulary.dart';

class PlayerControls extends StatelessWidget {
  final Vocabulary vocabulary;

  const PlayerControls({
    @required this.vocabulary,
  }) : assert(vocabulary != null);

  @override
  Widget build(BuildContext context) {
    final vocabProvider = Provider.of<VocabProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IconButton(
        icon: Icon(
          vocabProvider.isPlaying ? Icons.stop : Icons.play_circle_outline,
          size: 40.0,
        ),
        onPressed: () => vocabProvider.play(vocabulary),
      ),
    );
  }
}
