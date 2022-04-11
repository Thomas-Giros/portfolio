import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF8F8F8);
const secondaryColor = Color(0xFF006CCB);
const tertiaryColor = Color(0xFFFFEB00);

const primaryColorDark = Color(0xFF000000);
const secondaryColorDark = Color(0xFF000867);
const tertiaryColorDark = Color(0xFF841E01);

const tightOpacity = 0.9;
const wideOpacity = 0.6;

class AppColors{

  static Color prim = primaryColor;
  static Color sec = secondaryColor;
  static Color ter = tertiaryColor;
  static Color textColor = primaryColorDark;

  static setDarkMode(){
    prim = secondaryColorDark;
    sec = primaryColorDark;
    ter = tertiaryColorDark;
    textColor = primaryColor;
  }

  static setLightMode(){
    prim = primaryColor;
    sec = secondaryColor;
    ter = tertiaryColor;
    textColor = primaryColorDark;
  }
}