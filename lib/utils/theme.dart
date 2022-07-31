import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: APPColors.kcGraphSecondary,
      scaffoldBackgroundColor: Colors.white,
      // inputDecorationTheme: const InputDecorationTheme(
      //   // enabledBorder: OutlineInputBorder(
      //   //   borderSide: BorderSide(width: 3, color: APPColors.kcOrange),
      //   // ),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: BorderSide(width: 3, color: APPColors.kcOrange),
      //   ),
      //   labelStyle: TextStyle(color: APPColors.kcGraphPrimary)
      // ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: APPColors.kcOrange),
    );
  }
}
