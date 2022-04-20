import 'package:flutter/material.dart';
import 'package:portfolio/Screens/Home/Components/AppBar.dart';
import 'package:portfolio/Screens/Home/Components/WorkLayout.dart';
import 'package:portfolio/Screens/Home/Components/AboutLayout.dart';
import 'package:portfolio/languages/Languages.dart';
import 'package:portfolio/Screens/Home/Components/Bottom.dart';
import 'package:animated_background/animated_background.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String page;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum ParticleType {
  Shape,
  Image,
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late ScrollController _scrollController;
  String message = "";
  double _height = 100;

  double? workLayoutHeight;
  double? workLayoutWidth;

  // Particles
  //ParticleType? _particleType = ParticleType.Image;
  //Image _image = Image.asset('assets/images/star_stroke.png');

  ParticleOptions particleOptions = ParticleOptions(
    //image: Image.asset('assets/images/star_stroke.png'),
    baseColor: Colors.blue,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.6,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 80,
  );

  var particlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..blendMode = BlendMode.multiply
    ..strokeWidth = 2.0;


  // Lines

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body :Container(
        height: size.height,
        width: size.width,
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: particleOptions,
            paint: particlePaint,
          ),
          vsync: this,
          child:Column(
            children: [
              CustomAppBar(
                changeLanguage: _changeLanguage,
                workLayout: _switchToWorkLayout ,
                aboutLayout: _switchToAboutLayout,
              ),
              Expanded(
                child: SingleChildScrollView(
                    controller: _scrollController,
                      child : buildLayout(),
                  ),
              ),
              BottomElementOfBody(height: _height,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLayout() {
    if (widget.page == "work")
      return WorkLayout();
    else if (widget.page == "about")
      return AboutLayout();
    else
      return Container();
  }

  bool open = true;
  _switchToWorkLayout(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen(page: "work")),
    );
  }

  _switchToAboutLayout(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen(page: "about")),
    );
  }

  _changeLanguage(){
    setState(() {
      Languages.changeLanguage();
    });
    Languages.translate().whenComplete(() {
      setState(() {});
      Languages.languageChanged();
    });
  }

  _scrollListener() {
    setState(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
          message = "reach the bottom";
          _height = 100;
      } else {
          message = _scrollController.position.toString();
          _height = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController(
      //initialScrollOffset: 0.0,
      //keepScrollOffset: true,
    );
    _scrollController.addListener(_scrollListener);

    Languages.translate().whenComplete(() {
      setState(() {});
    });

  }
}
