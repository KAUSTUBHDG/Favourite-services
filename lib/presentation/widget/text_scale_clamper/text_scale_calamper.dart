import 'package:flutter/material.dart';

class TextScaleFactorClamper extends StatelessWidget {
  const TextScaleFactorClamper({
    required this.child,
    this.minScaleFactor = 0.5,
    this.maxScaleFactor = 1,
    super.key,
  });

  final Widget child;
  final double minScaleFactor;
  final double maxScaleFactor;

  @override
  Widget build(BuildContext context) {
    final TextScaler systemTextScaleFactor = MediaQuery.of(context).textScaler;

    // Clamp the textScaleFactor
    final TextScaler clampedScaleFactor = systemTextScaleFactor.clamp(
      minScaleFactor: minScaleFactor,
      maxScaleFactor: maxScaleFactor,
    );

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: clampedScaleFactor,
      ),
      child: child,
    );
  }
}
