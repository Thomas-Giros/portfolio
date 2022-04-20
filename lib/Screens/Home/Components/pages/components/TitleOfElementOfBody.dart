import 'package:flutter/material.dart';
import 'package:portfolio/styles/Styles.dart';

class TitleOfElementOfBody extends StatelessWidget {
  const TitleOfElementOfBody({
    required  this.title,
    Key? key
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25,60,0,20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title.toUpperCase(),
          style: AllTextStyles.TitleTextStyle(),
        ),
      ),
    );
  }
}

