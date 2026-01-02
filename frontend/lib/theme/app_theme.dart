import 'package:flutter/material.dart';

class AppTheme {
  // Microsoft Brand Colors
  static const Color microsoftBlue = Color(0xFF0078D4);
  static const Color microsoftDarkGray = Color(0xFF323130);
  static const Color microsoftLightGray = Color(0xFFF3F2F1);
  static const Color softWhite = Color(0xFFFAF9F8);

  // Semaphore Colors for Burnout Risk
  static const Color riskLow = Color(0xFF107C10); // Microsoft Green
  static const Color riskMedium = Color(0xFFFFB900); // Microsoft Yellow
  static const Color riskHigh = Color(0xFFD83B01); // Microsoft RedOrange

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Segoe UI',
      brightness: Brightness.light,
      primaryColor: microsoftBlue,
      scaffoldBackgroundColor: microsoftLightGray,

      colorScheme: const ColorScheme.light(
        primary: microsoftBlue,
        secondary: microsoftDarkGray,
        surface: Colors.white,
        background: microsoftLightGray,
        error: riskHigh,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: microsoftDarkGray,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: microsoftDarkGray),
        titleTextStyle: TextStyle(
          color: microsoftDarkGray,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
        ),
      ),

      /*
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Microsoft Fluent UI style
        ),
        margin: const EdgeInsets.only(bottom: 12),
      ),
      */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: microsoftBlue,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xFF8A8886)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xFFE1DFDD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: microsoftBlue, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
