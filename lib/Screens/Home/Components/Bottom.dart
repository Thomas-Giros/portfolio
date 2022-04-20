import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/styles/Styles.dart';
import 'package:portfolio/colors/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';
import 'package:portfolio/languages/Languages.dart';


class BottomElementOfBody extends StatefulWidget {
  BottomElementOfBody({
    required this.height,
    Key? key,
  }) : super(key: key);
  double height;

  @override
  State<BottomElementOfBody> createState() => _BottomElementOfBodyState();
}



class _BottomElementOfBodyState extends State<BottomElementOfBody> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.height,
      duration: Duration(milliseconds: 800),
      decoration: BoxDecoration(
        color: AppColors.prim.withOpacity(0.50),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.16)),
        ],
      ),
      child: buildRow(),
    );
  }

  Row buildRow() {
    return Row(
      children:  [
        const ContainerOfBottom(
          alignement: MainAxisAlignment.end,
          text1: " +1 438 880 2044 ",
          logoAsset1: 'assets/images/phone_icon.svg',
          text2: " github ",
          logoAsset2: 'assets/images/github_icon.svg',
          isSwap: true,
          sourceLink: "https://github.com/Thomas-Giros",
        ),
        SizedBox(width: 3,),
        ContainerOfBottom(
          alignement: MainAxisAlignment.start,
          text1: Languages.sendEmail,
          logoAsset1: 'assets/images/email_icon.svg',
          text2: " linked in  ",
          logoAsset2: 'assets/images/linkedin_icon.svg',
          isSwap: false,
          sourceLink: "https://www.linkedin.com/in/thomas-giros-a53698a1/",
        ),
      ],
    );
  }
}

class ContainerOfBottom extends StatelessWidget {
  const ContainerOfBottom({
    required this.alignement,
    required this.text1,
    required this.logoAsset1,
    required this.text2,
    required this.logoAsset2,
    required this.isSwap,
    required this.sourceLink,
    Key? key,
  }) : super(key: key);

  final alignement;
  final String text1;
  final String logoAsset1;
  final String text2;
  final String logoAsset2;
  final bool isSwap;
  final String sourceLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.0 -1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: alignement,
              children: [
                LogoTextAnimatedWidget(
                  text: text1,
                  logoAsset: logoAsset1,
                  swap: isSwap,
                  sourceLink: "",
                ),
              ],
            ),
          ),
          SizedBox(height: 2,),
          Flexible(
            child: Row(
              mainAxisAlignment: alignement,
              children: [
                LogoTextAnimatedWidget(
                  text: text2,
                  logoAsset: logoAsset2,
                  swap: isSwap,
                  sourceLink: sourceLink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LogoTextAnimatedWidget extends StatefulWidget {
  const LogoTextAnimatedWidget({
    Key? key,
    required this.text,
    required this.logoAsset,
    required this.swap,
    required this.sourceLink,
  }) : super(key: key);
  final String text;
  final String logoAsset;
  final bool swap;
  final String sourceLink;

  @override
  State<LogoTextAnimatedWidget> createState() => _LogoTextAnimatedWidgetState();
}

class _LogoTextAnimatedWidgetState extends State<LogoTextAnimatedWidget> {
  static double size = 35;
  double _width = size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapLogo,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: AppColors.prim,
          border: Border.all(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.16)),
          ],
        ),
        width: _width,
        height: size,
        duration: Duration(milliseconds: 500),
        child: Row(
          children:
              stackChildrenLogoText(widget.logoAsset, widget.text, widget.swap, widget.sourceLink),
        ),
      ),
    );
  }

  onLanguageChange(){
    setState(() {
      if (_width != size) {
        _width = _textSize(Languages.sendEmail, AllTextStyles.BottomTextStyle(size / 1.8)).width + size;
      } else
        _width = size;
    });
  }

  onTapLogo() {
    setState(() {
      if (_width == size) {
        _width = _textSize(widget.text, AllTextStyles.BottomTextStyle(size / 1.8)).width + size;
      } else
        _width = size;
    });
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: MediaQuery.of(context).size.width);
    return textPainter.size;
  }

  List<Widget> stackChildrenLogoText(String logo, String text, bool swap, String sourceLink) {
    List<Widget> stackChildren = <Widget>[
      SizedBox(
          width: size - 2,
          height: size - 2,
          child: SvgPicture.asset(
            logo,
            color: Colors.black,
          )),
      Flexible(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, size / 4.5),
          child: textOfLogo(text,sourceLink),
        ),
      ),
    ];

    if (swap == true) {
      final temp = stackChildren[0];
      stackChildren[0] = stackChildren[1];
      stackChildren[1] = temp;
    }
    return stackChildren;
  }

  Widget textOfLogo(String _text, String sourceLink) {
    if (sourceLink.isNotEmpty) {
        return RichText(
          text: TextSpan(
            text: _text,
            style: AllTextStyles.LinkTextStyle(),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(sourceLink);
              },
          ),
        );

    } else {
      if (_text == Languages.sendEmail) {
        return InkWell(
          onTap: () async {
            final mailtoLink = Mailto(
              to: ['thomas.giros@gmail.com'],
            );
            // Convert the Mailto instance into a string.
            // Use either Dart's string interpolation
            // or the toString() method.
            await launch('$mailtoLink');
          },
          child: Text(
            _text,
            style: AllTextStyles.BottomTextStyle(size / 1.8),
          ),
        );
      } else {
        return Text(
          _text,
          style: AllTextStyles.BottomTextStyle(size / 1.8),
        );
      }
    }
  }

  @override
  void initState() {
    if (widget.text == Languages.sendEmail)
      Languages.foo.add(onLanguageChange);
  }
}


class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputType? type;

  TextFields({required this.controller, required this.name, required this.validator,this.maxLines,this.type});
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(40.0),borderSide: BorderSide.none);
    return  Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: type,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey[300],
          filled: true,
          labelText: name,
          focusedErrorBorder: border,
          focusedBorder: border,
          enabledBorder: border,
          errorBorder: border,
        ),
        // The validator receives the text that the user has entered.
        validator: validator,
      ),
    );
  }
}