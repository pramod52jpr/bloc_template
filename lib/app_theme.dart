import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.grey.shade200,
      titleTextStyle: const TextStyle(
        color: Colors.black
      ),
      subtitleTextStyle: const TextStyle(
        color: Colors.black
      ),
      leadingAndTrailingTextStyle: const TextStyle(
        color: Colors.black
      )
    )
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    listTileTheme: const ListTileThemeData(
        tileColor: Colors.green,
        titleTextStyle: TextStyle(
            color: Colors.white
        ),
        subtitleTextStyle: TextStyle(
            color: Colors.white
        ),
        leadingAndTrailingTextStyle: TextStyle(
            color: Colors.white
        )
    )
  );
}