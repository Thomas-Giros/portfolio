
import 'package:flutter/material.dart';
import 'package:portfolio/styles/Styles.dart';
import 'package:portfolio/languages/Languages.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required this.changeLanguage,
  }) : super(key: key);

  final void Function() changeLanguage;


  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>  {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0,-2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.16)
          ),
        ],
      ),
      child: Row(
        children: [
          //Image.asset("assets/images/logo.png",scale: 15,),
          SizedBox(width: 5),
          Text(
            "Thomas Giros".toUpperCase(),
            style: AllTextStyles.TitleTextStyle(),
            textAlign: TextAlign.left,
          ),
          Spacer(),
          MenuItem(title : Languages.work,
            press: () {},
          ),
          Text(
            "|".toUpperCase(),
            style : AllTextStyles.TextTextStyle(),
          ),
          MenuItem(title : Languages.about,
            press: () {},
          ),
          VerticalDivider(),
          MenuItem(title : Languages.language,
            press: widget.changeLanguage,
          ),
        ],
      ),
    );
  }

}


class MenuItem extends StatelessWidget {
  final String title;
  final void Function() press;

  const MenuItem({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title.toUpperCase(),
          style : AllTextStyles.TextTextStyle()
        ),
      ),
    );
  }
}
