import 'package:flutter/material.dart';

class LightTheme {
  static theme() {
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: const Color(0xFFE95A00),
          ),
      hintColor: const Color(0xFF2A8C68),
      iconTheme: const IconThemeData(color: Color(0xFF007D3C)),
      backgroundColor: Colors.white,
      primaryColor: const Color(0xFF007D3C),
      errorColor: const Color(0xFFD91111),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black, fontSize: 18),
        headline2: TextStyle(color: Colors.black, fontSize: 14),
        headline6: TextStyle(
            fontWeight: FontWeight.w100, color: Colors.black, fontSize: 16),
        bodyText1: TextStyle(color: Colors.black, fontSize: 18),
        bodyText2: TextStyle(color: Colors.black, fontSize: 14),
        subtitle1: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        subtitle2: TextStyle(
            color: Color(0xFF2A8C68),
            fontSize: 16,
            fontWeight: FontWeight.w500),
        button: TextStyle(color: Colors.white, fontSize: 16),
        caption: TextStyle(color: Color(0xFF2A8C68), fontSize: 16),
        overline: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
