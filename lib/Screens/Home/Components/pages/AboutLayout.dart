import 'package:flutter/material.dart';
import 'package:portfolio/languages/Languages.dart';
//import 'package:portfolio/Screens/Home/Components/pages/components/AnimatedElementOfBodyWithMedia.dart';
import 'package:portfolio/Screens/Home/Components/pages/components/StaticElementOfBody.dart';
import 'package:portfolio/Screens/Home/Components/pages/components/TitleOfElementOfBody.dart';

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
        StaticElementOfBody(presentationText: Languages.presentationText,),
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
