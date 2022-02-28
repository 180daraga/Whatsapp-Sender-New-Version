import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFF700608);
const PrimaryColorLight = const Color(0xFF700608);
const PrimaryColorDark = const Color(0xFF700608);

const SecondaryColor = const Color(0xFF075E54);
const SecondaryColorLight = const Color(0xFF075E54);
const SecondaryColorDark = const Color(0xFF075E54);

const ThirdColor = const Color(0xFF2B2929);

const TextFieldFill = const Color(0xFFedf2f6);

const Background = const Color(0xFFE5E5E5);
const TextColor = const Color(0xFF000000);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: SecondaryColor,
      accentColorBrightness: Brightness.dark,
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      primaryColorBrightness: Brightness.dark,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: SecondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: PrimaryColor,
        elevation: 0
      ),
      scaffoldBackgroundColor: Background,
      cardColor: Background,
      textSelectionColor: PrimaryColorLight,
      backgroundColor: Background,
      iconTheme: IconThemeData(color: const Color(0xFF808080), size: 30),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: ThirdColor,
          type: BottomNavigationBarType.fixed,
          elevation: 10.0,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              color: Colors.grey
          )
      ),
      textTheme: base.textTheme.copyWith(
        bodyText1: TextStyle(
            fontSize: 15, color: Colors.white),
        bodyText2: TextStyle(
            fontSize: 15, color: Colors.black),
      ),
    );
  }
}
