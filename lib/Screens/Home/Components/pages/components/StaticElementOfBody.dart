import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/styles/Styles.dart';
import 'package:portfolio/colors/AppColors.dart';


class StaticElementOfBody extends StatelessWidget {
  const StaticElementOfBody({
    required this.presentationText,
    Key? key,
  }) : super(key: key);
  final String presentationText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20,0,20,10),
      decoration: BoxDecoration(
        color: AppColors.prim.withOpacity(wideOpacity),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0,-2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.16)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Text(
                presentationText,
                style: AllTextStyles.TextTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}