import 'package:flutter/material.dart';
import 'package:portfolio/styles/Styles.dart';
import 'package:portfolio/languages/Languages.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required this.changeLanguage,
    required this.workLayout,
    required this.aboutLayout,
  }) : super(key: key);

  final void Function() changeLanguage;
  final void Function() workLayout;
  final void Function() aboutLayout;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.all(10),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.16)),
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
          MenuItem(
            title: Languages.work,
            press: widget.workLayout,
          ),
          Text(
            "|".toUpperCase(),
            style: AllTextStyles.TextTextStyle(),
          ),
          MenuItem(
            title: Languages.about,
            press:  widget.aboutLayout,
          ),
          VerticalDivider(),
          MenuItem(
            title: Languages.language,
            press: widget.changeLanguage,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final String title;
  final void Function() press;

  MenuItem({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  double underlineWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
      child: InkWell(
          onTap: () {
            //You can leave it empty, like that.
          },
        onHover: (val) {
          onHover(val);
        },
        child: Column(
          children: [
            Container(
              child: InkWell(
                onTap: widget.press,
                child: Text(
                  widget.title.toUpperCase(),
                  style: AllTextStyles.TextTextStyle(),
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              width: underlineWidth,
              height: 2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onHover(bool isHovered){
    setState(() {
      if (isHovered)
          underlineWidth = _textSize(widget.title.toUpperCase(),AllTextStyles.TextTextStyle()).width;
       else
          underlineWidth = 0;
    });
  }

  Size _textSize(String text, TextStyle style) {

    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), textDirection: TextDirection.ltr)
      ..layout(minWidth: 0);
    return textPainter.size;
  }
}
