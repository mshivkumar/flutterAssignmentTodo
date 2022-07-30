import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: APPColors.kcGraphSecondary,
      scaffoldBackgroundColor: Colors.white,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: APPColors.kcOrange),
    );
  }
}
