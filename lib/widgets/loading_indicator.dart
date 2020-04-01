import 'package:flutter/material.dart';

import 'package:greader/styles/styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: primaryColor,
        duration: Duration(seconds: 1),
        size: 40.0,
        type: SpinKitWaveType.center,
      ),
    );
  }
}
