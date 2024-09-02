import 'package:flutter/material.dart';

class AppThemes {
  // light theme configurations
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        color: Colors.green,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        elevation: 10,
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFFF0000),
          fontFamily: 'Montserrat',
          fontSize: 14.0,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey[600],
          fontFamily: 'Montserrat',
          fontSize: 12.0,
        ),
        selectedItemColor: const Color(0xFFFF0000),
        unselectedItemColor: const Color(0xFFFF0000),
        showUnselectedLabels: true,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ), bottomAppBarTheme: const BottomAppBarTheme(color: Colors.amber),
    );
  }

  // dark theme configurations
  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.yellow),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.green,
        elevation: 10,
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFA67926),
          fontFamily: 'Montserrat',
          fontSize: 14.0,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey[600],
          fontFamily: 'Montserrat',
          fontSize: 12.0,
        ),
        selectedItemColor: const Color(0xFFA67926),
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
      ),
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ),
    );
  }
}
