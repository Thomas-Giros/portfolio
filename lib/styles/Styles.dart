import 'package:flutter/material.dart';
import 'package:portfolio/colors/AppColors.dart';
import 'package:portfolio/dimensions/Dimensions.dart';

class AllTextStyles{

  static TextStyle TitleTextStyle() {
    return TextStyle(
      fontSize: Dimensions.Titles,
      fontWeight:
      FontWeight.bold,
      color: Colors.black,
      //decoration: TextDecoration.none,
    );
  }

  static TextStyle TextTextStyle() {
    return TextStyle(
      fontSize: Dimensions.Text,
      fontWeight:
      FontWeight.bold,
      //color: Colors.black,
      //decoration: TextDecoration.none,
    );
  }

  static TextStyle TextTextStyleonHover() {
    return TextStyle(
      fontSize: Dimensions.Text,
      fontWeight: FontWeight.bold,
      //color: Colors.black,
      decoration: TextDecoration.underline,

      color: Colors.transparent,
      decorationColor: Colors.black,
      decorationThickness: 4,
    );
  }

  static TextStyle LinkTextStyle() {
    return TextStyle(
      fontSize: Dimensions.Text,
      fontWeight: FontWeight.bold,
      color: AppColors.sec,
      //decoration: TextDecoration.none,
    );
  }

  static TextStyle BottomTextStyle(double textSize) {
    return TextStyle(
      fontSize: textSize,
      fontWeight: FontWeight.bold,
      //decoration: TextDecoration.none,
    );
  }

}