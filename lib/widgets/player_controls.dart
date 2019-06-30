import 'package:flutter/material.dart';

import 'package:greader/styles/styles.dart';

class PlayerControls extends StatefulWidget {
  @override
  _PlayerControlsState createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      borderRadius: BorderRadius.circular(32.0),
      elevation: 8.0,
      child: Container(
        width: 120.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.all(4.0),
              icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
              iconSize: 44.0,
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.stop),
              iconSize: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}
