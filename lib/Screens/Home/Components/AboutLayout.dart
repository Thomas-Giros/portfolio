import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/styles/Styles.dart';
import 'package:portfolio/languages/Languages.dart';
import 'package:portfolio/colors/AppColors.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutLayout extends StatelessWidget {
  const AboutLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElementOfBody();
  }
}

class ElementOfBody extends StatelessWidget {
  const ElementOfBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleOfElementOfBody(title: "Ma vie mon oeuvre",),
        PresentationElementOfBody(presentationText: Languages.presentationText,),
        //TitleOfElementOfBody(title: Languages.myProjects,),
/*        ProjectsElementOfBody(
          title: "Spim",
          text: Languages.spimText,
          sourceLink: 'https://play.google.com/store/apps/details?id=com.tgiros.spim',
          sourceDescription: "Google Play",
          mediaLocation: 'videos/spim_demo.mp4',
          media: "video",
        ),*/

        SizedBox(height: 110),
      ],
    );
  }
}


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


class PresentationElementOfBody extends StatelessWidget {
  const PresentationElementOfBody({
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


class ProjectsElementOfBody extends StatefulWidget {
  const ProjectsElementOfBody({
    Key? key,
    required this.title,
    required this.text,
    required this.mediaLocation,
    required this.sourceLink,
    required this.sourceDescription,
    required this.media,
  }) : super(key: key);

  final String title;
  final String text;
  final String mediaLocation;
  final String sourceLink;
  final String sourceDescription;
  final String media;


  @override
  State<ProjectsElementOfBody> createState() => _ProjectsElementOfBodyState();
}

class _ProjectsElementOfBodyState extends State<ProjectsElementOfBody> {
  final double _paddingInset = 10;
  static const double _paddingRight = 20;
  static const double _paddingLeft = 20;
  late double _widthBoxTop;
  late double _heightBoxTop;
  late double _widthBoxBottom;
  late double _heightBoxBottom = 45;
  late double _imageWidth;
  bool firstTime = true;
  Color _color = Colors.white.withOpacity(0.8);
  late String _text = widget.title;
  BorderRadius _borderRadiusTop = BorderRadius.circular(10);
  late String media = widget.media;
  late final VideoPlayerController _controller;


  @override
  Widget build(BuildContext context) {
    if (firstTime)
    {
      setTextAndColor(_text, Colors.white.withOpacity(0.9));
      firstTime = false;
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(_paddingLeft,0, _paddingRight ,10),
        child: InkWell(
          onTap: _update,
          child: Column(
            children: [
              AnimatedContainer(
                onEnd: setDefaultSizeValues(),
                padding: EdgeInsets.all(_paddingInset),
                width: _widthBoxTop,
                height: _heightBoxTop,
                duration: Duration(milliseconds: 800),
                child:  Text(widget.text, style: AllTextStyles.TextTextStyle(),),
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadiusTop,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0,-2),
                        blurRadius: 30,
                        color: Colors.black.withOpacity(0.16)
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 800),
                width: _imageWidth,
                child:AspectRatio(
                  aspectRatio: 16.0/9.0,
                  child: MediaContainer(),
                ),
              ),
              AnimatedContainer(
                padding: EdgeInsets.all(_paddingInset),
                width: _widthBoxBottom,
                height: _heightBoxBottom,
                duration: Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0,-2),
                        blurRadius: 30,
                        color: Colors.black.withOpacity(0.16)
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(text: TextSpan(
                    text: widget.sourceDescription,
                    style: AllTextStyles.LinkTextStyle(),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () { launch(widget.sourceLink);
                      },
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MediaContainer() {
    if (media == "video") {
      return VideoPlayer(_controller);
    } else if (media == "image") {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.mediaLocation),
              fit: BoxFit.cover,
              opacity: 0.95
          ),
        ),
      );
    } else
    {
      return Container();
    }
  }

  setDefaultSizeValues() {
    TextStyle ts = AllTextStyles.TextTextStyle();
    _widthBoxTop = _textSize(_text, ts).width + _paddingInset * 2;
    _heightBoxTop = _textSize(_text, ts).height + _paddingInset * 2;


    if (_text == widget.title) {
      _imageWidth = 0;
      _widthBoxBottom = 0;
      _heightBoxBottom = 0;
    }
    else{
      _imageWidth = MediaQuery.of(context).size.width ;
      _widthBoxBottom = _textSize(_text,ts).width + _paddingInset*2;
      _heightBoxBottom = 45;
    }

  }

  Size _textSize(String text, TextStyle style) {

    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: MediaQuery.of(context).size.width - (_paddingInset*2 + _paddingLeft + _paddingRight) );
    return textPainter.size;
  }

  void setTextAndColor(String text, Color color){
    TextStyle ts = AllTextStyles.TitleTextStyle();
    _text = text;
    _widthBoxTop = _textSize(text,ts).width + _paddingInset*2;
    _heightBoxTop = _textSize(text,ts).height + _paddingInset*2 ;
    _widthBoxBottom = _textSize(text,ts).width + _paddingInset*2;
    _color = color;
  }

  void _update(){
    if (_text == widget.title)
    {
      setState(() {
        if (media == "video")
        {
          _controller.setLooping(true);
          _controller.play();
        }
        _text = widget.text;
        _borderRadiusTop = BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0));
        setTextAndColor(_text,Colors.white.withOpacity(0.5));

      });
    } else
    {
      setState(() {
        if (media == "video")
        {
          _controller.pause();
        }
        _text = widget.title;
        _borderRadiusTop = BorderRadius.circular(10);
        setTextAndColor(_text, Colors.white.withOpacity(0.9));
      });
    }
  }

  void update(){

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (_text != widget.title)
        {
          _borderRadiusTop = BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0));
          setTextAndColor(widget.text,Colors.white.withOpacity(0.5));
        }
      });

    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.media == "video"){
      _controller = VideoPlayerController.asset('videos/spim_demo.mp4',);
      _controller.initialize();
    }
    Languages.foo.add( update);
  }
}
