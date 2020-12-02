import 'package:flutter/widgets.dart';

class ScreenSettings {
  final double factor;

  ScreenSettings(BuildContext context)
      : factor = MediaQuery.textScaleFactorOf(context);

  double get bar => factor * 60;
  double get icon => factor * 25;
  double get height => factor * 300;
}
