import 'package:flutter/material.dart';
import 'package:portfolio/styles/Styles.dart';
import 'package:portfolio/languages/Languages.dart';
import 'package:portfolio/colors/AppColors.dart';
import 'package:video_player/video_player.dart';


class WorkLayout extends StatefulWidget {
  const WorkLayout({Key? key}) : super(key: key);

  @override
  State<WorkLayout> createState() => _WorkLayoutState();
}

class _WorkLayoutState extends State<WorkLayout> {

  @override
  Widget build(BuildContext context) {
    return ElementOfBody();
  }
}

class ElementOfBody extends StatefulWidget {
  const ElementOfBody({Key? key}) : super(key: key);

  @override
  State<ElementOfBody> createState() => _ElementOfBodyState();
}

class _ElementOfBodyState extends State<ElementOfBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleOfElementOfBody(title: Languages.presentation,),
        BodyOfElementOfBody(presentationText: Languages.presentationText,),
        TitleOfElementOfBody(title: Languages.myProjects,),
        MyProjectsElementOfBody(),
        TitleOfElementOfBody(title: Languages.otherProjects,),
        OtherProjectsElementOfBody(title: "Head generator",),
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


class BodyOfElementOfBody extends StatelessWidget {
  const BodyOfElementOfBody({
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

class MyProjectsElementOfBody extends StatefulWidget {
  const MyProjectsElementOfBody({Key? key}) : super(key: key);

  @override
  State<MyProjectsElementOfBody> createState() => _MyProjectsElementOfBodyState();
}

class _MyProjectsElementOfBodyState extends State<MyProjectsElementOfBody> {
  final double _paddingInset = 10;
  static const double _paddingRight = 20;
  static const double _paddingLeft = 20;
  late double _widthBoxTop;
  late double _heightBoxTop;
  late double _widthBoxBottom;
  late double _heightBoxBottom = 40;
  late double _videoWidth;
  bool firstTime = true;
  Color _color = Colors.white.withOpacity(0.8);
  int lol = 0;
  String title = "Spim";
  late String _text = title;
  BorderRadius _borderRadiusTop = BorderRadius.circular(10);

  final VideoPlayerController _controller = VideoPlayerController.asset('videos/spim_demo.mp4',);


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
        padding: const EdgeInsets.fromLTRB(_paddingLeft,0, _paddingRight ,0),
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
                child:  Text(Languages.spimText, style: AllTextStyles.TextTextStyle(),),
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
                width: _videoWidth,
                child: AspectRatio(
                  aspectRatio: 16.0/9.0,
                  child: VideoPlayer(_controller),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  setDefaultSizeValues() {
    TextStyle ts = AllTextStyles.TextTextStyle();
    _widthBoxTop = _textSize(_text, ts).width + _paddingInset * 2;
    _heightBoxTop = _textSize(_text, ts).height + _paddingInset * 2;


    if (_text == title) {
      _videoWidth = 0;
      _widthBoxBottom = 0;
      _heightBoxBottom = 0;
    }
    else{
      _videoWidth = MediaQuery.of(context).size.width - (_paddingInset*2 );
      _widthBoxBottom = _textSize(_text,ts).width + _paddingInset*2;
      _heightBoxBottom = 40;
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
    if (_text == title)
    {
      setState(() {
        _controller.setLooping(true);
        _controller.play();
        _text = Languages.spimText;
        _borderRadiusTop = BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0));
        setTextAndColor(Languages.spimText,Colors.white.withOpacity(0.5));

      });
    } else
    {
      setState(() {
        _text = title;
        _controller.pause();
        _borderRadiusTop = BorderRadius.circular(10);
        setTextAndColor(_text, Colors.white.withOpacity(0.9));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.initialize();
  }
}

class OtherProjectsElementOfBody extends StatefulWidget {
  const OtherProjectsElementOfBody({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<OtherProjectsElementOfBody> createState() => _OtherProjectsElementOfBodyState();
}

class _OtherProjectsElementOfBodyState extends State<OtherProjectsElementOfBody> {
  final double _paddingInset = 10;
  static const double _paddingRight = 20;
  static const double _paddingLeft = 20;
  late double _widthBoxTop;
  late double _heightBoxTop;
  late double _widthBoxBottom;
  late double _heightBoxBottom = 40;
  late double _videoWidth;
  bool firstTime = true;
  Color _color = Colors.white.withOpacity(0.8);
  late String _text = widget.title;
  BorderRadius _borderRadiusTop = BorderRadius.circular(10);


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
        padding: const EdgeInsets.fromLTRB(_paddingLeft,0, _paddingRight ,0),
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
                child:  Text(Languages.otherProjectsText, style: AllTextStyles.TextTextStyle(),),
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
                width: _videoWidth,
                child: Text(_text, style: AllTextStyles.TextTextStyle(),),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  setDefaultSizeValues() {
    TextStyle ts = AllTextStyles.TextTextStyle();
    _widthBoxTop = _textSize(_text, ts).width + _paddingInset * 2;
    _heightBoxTop = _textSize(_text, ts).height + _paddingInset * 2;


    if (_text == widget.title) {
      _videoWidth = 0;
      _widthBoxBottom = 0;
      _heightBoxBottom = 0;
    }
    else{
      _videoWidth = MediaQuery.of(context).size.width - (_paddingInset*2 );
      _widthBoxBottom = _textSize(_text,ts).width + _paddingInset*2;
      _heightBoxBottom = 40;
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
        _text = Languages.otherProjectsText;
        _borderRadiusTop = BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0));
        setTextAndColor(_text,Colors.white.withOpacity(0.5));

      });
    } else
    {
      setState(() {
        _text = widget.title;
        _borderRadiusTop = BorderRadius.circular(10);
        setTextAndColor(_text, Colors.white.withOpacity(0.9));
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }
}