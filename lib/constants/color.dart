import 'package:flutter/material.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark = Color(0xFF1E0771);

const appPurpleLight1 = Color(0xFF9345F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE6704A);

ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: appPurpleDark),
    primaryColor: appPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 4,
      backgroundColor: appPurple,
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: appPurpleDark),
        headlineLarge: TextStyle(color: appPurpleDark),
        headlineMedium: TextStyle(color: appPurpleDark),
        headlineSmall: TextStyle(color: appPurpleDark),
        bodySmall: TextStyle(color: appPurpleDark),
        bodyMedium: TextStyle(color: appPurpleDark),
        bodyLarge: TextStyle(color: appPurpleDark)),
    listTileTheme: const ListTileThemeData(textColor: appPurpleDark),
    tabBarTheme: const TabBarTheme(
      indicatorColor: appPurpleDark,
      labelColor: appPurpleDark,
      unselectedLabelColor: Colors.grey,
    ));

ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: appPurpleLight2,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: appWhite),
    scaffoldBackgroundColor: appPurpleDark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: appPurpleDark,
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: appWhite),
        headlineLarge: TextStyle(color: appWhite),
        headlineMedium: TextStyle(color: appWhite),
        headlineSmall: TextStyle(color: appWhite),
        bodySmall: TextStyle(color: appWhite),
        bodyMedium: TextStyle(color: appWhite),
        bodyLarge: TextStyle(color: appWhite)),
    listTileTheme: const ListTileThemeData(textColor: appWhite),
    tabBarTheme: const TabBarTheme(
      indicatorColor: appWhite,
      labelColor: appWhite,
      unselectedLabelColor: Colors.grey,
    ));
