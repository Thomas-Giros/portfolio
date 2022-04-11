import 'package:flutter/material.dart';
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

}