import 'package:flutter/material.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark = Color(0xFF1E0771);

const appPurpleLight1 = Color(0xFF9345F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE6704A);

ThemeData themeLight = ThemeData(
  primaryColor: appPurple,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: appPurple,
  ),
  textTheme: TextTheme(
    titleLarge:  TextStyle(
      color: appPurpleDark
    ),
    headlineLarge: TextStyle(
      color: appPurpleDark
    ),
    headlineMedium: TextStyle(
      color: appPurpleDark
    ),
    headlineSmall: TextStyle(
      color: appPurpleDark
    ),
    bodySmall: TextStyle(
      color: appPurpleDark
    ),
    bodyMedium: TextStyle(
      color: appPurpleDark
    ),
    bodyLarge: TextStyle(
      color: appPurpleDark
    )
  )
);

ThemeData themeDark = ThemeData(
  primaryColor: appPurpleLight2,
  scaffoldBackgroundColor: appPurpleDark,
  appBarTheme: AppBarTheme(
    backgroundColor: appPurpleDark,
  ),
  textTheme: TextTheme(
    titleLarge:  TextStyle(
      color: appWhite
    ),
    headlineLarge: TextStyle(
      color: appWhite
    ),
    headlineMedium: TextStyle(
      color: appWhite
    ),
    headlineSmall: TextStyle(
      color: appWhite
    ),
    bodySmall: TextStyle(
      color: appWhite
    ),
    bodyMedium: TextStyle(
      color: appWhite
    ),
    bodyLarge: TextStyle(
      color: appWhite
    )
  )
);