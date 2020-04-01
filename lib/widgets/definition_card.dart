import 'package:flutter/material.dart';

import 'package:greader/models/definition.dart';

import 'package:greader/styles/styles.dart';
import 'package:animator/animator.dart';

class DefinitionCard extends StatelessWidget {
  final Definition definition;

  const DefinitionCard({
    @required this.definition,
  }) : assert(definition != null);

  @override
  Widget build(BuildContext context) {
    return Animator(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 200),
      builder: (Animation anim) => Transform.scale(
        scale: anim.value,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                definition.type,
                style: smallText.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8.0),
              Flexible(
                child: Text(
                  definition.definition,
                  style: mediumText,
                ),
              ),
              const SizedBox(height: 8.0),
              if (definition.example != null)
                Text(
                  'eg: ${definition.example}',
                  style: smallText,
                ),
              const SizedBox(height: 8.0),
              if (definition.imageUrl != null)
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.network(
                    definition.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              const Divider(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
