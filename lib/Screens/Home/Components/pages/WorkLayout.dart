import 'package:flutter/material.dart';
import 'package:portfolio/languages/Languages.dart';
import 'package:portfolio/Screens/Home/Components/pages/components/AnimatedElementOfBodyWithMedia.dart';
import 'package:portfolio/Screens/Home/Components/pages/components/StaticElementOfBody.dart';
import 'package:portfolio/Screens/Home/Components/pages/components/TitleOfElementOfBody.dart';

class WorkLayout extends StatelessWidget {
  const WorkLayout({Key? key}) : super(key: key);

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
        TitleOfElementOfBody(title: Languages.presentation,),
        StaticElementOfBody(presentationText: Languages.presentationText,),
        TitleOfElementOfBody(title: Languages.myProjects,),
        AnimatedElementOfBodyWithMedia(
          title: "Spim",
          text: Languages.spimText,
          sourceLink: 'https://play.google.com/store/apps/details?id=com.tgiros.spim',
          sourceDescription: "Google Play",
          mediaLocation: 'videos/spim_demo.mp4',
          media: "video",
        ),
        TitleOfElementOfBody(title: Languages.otherProjects,),
        AnimatedElementOfBodyWithMedia(
          title: "The Random Face Generator",
          text: Languages.RandomFaceText,
          sourceLink: "https://adityar224.github.io/Random-Face-Generator/#/",
          sourceDescription: "Source",
          mediaLocation: "assets/images/random_face.png",
          media: "image",
        ),
        AnimatedElementOfBodyWithMedia(
          title: "AppPainter",
          text: Languages.AppPainterText,
          sourceLink: "https://appainter.dev/#/",
          sourceDescription: "Source",
          mediaLocation: "assets/images/app_painter.png",
          media: "image",
        ),
        SizedBox(height: 110),
      ],
    );
  }
}


