import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:greader/providers/vocab_provider.dart';

import 'package:greader/styles/styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greader/widgets/vocabulary_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VocabProvider vocabProvider = Provider.of<VocabProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'GReader',
          style: largeText,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vocabProvider.fetchVocabs,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          children: <Widget>[
            Text(
              'Choose a Vocabulary...',
              style: mediumText,
            ),
            Expanded(
              child: vocabProvider.isLoading
                  ? Center(
                      child: SpinKitWave(
                        color: primaryColor,
                        duration: Duration(seconds: 1),
                        size: 40.0,
                        type: SpinKitWaveType.center,
                      ),
                    )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: vocabProvider.vocabs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return VocabularyCard(vocabProvider.vocabs[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
