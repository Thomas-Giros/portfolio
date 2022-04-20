import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class Languages {

  static double height = 100;

  static var foo = <Function>[];

  static void languageChanged(){
    for( var i = 0 ; i < foo.length; i++ ) {
      foo[i]() ;
    }
    //work = foo.length.toString();
  }


  // App Bar
  static String language = "En";
  static String work = "Work";
  static String about = "About";

  // Work - Presentation
  static String presentation = "";
  static String presentationText = "";

  // Work - My projects
  static String myProjects = "";
  static String spimText = "";

  // Work - projects I like
  static String otherProjects = "";
  static String RandomFaceText = "";
  static String AppPainterText = "";

  // Bottom
  static String sendEmail = "envoyer un courriel ";

  static var strings = <String>[];


  static Future<String> loadAsset(String asset) async {
    return await rootBundle.loadString(asset);
  }

  static void changeLanguage(){
    if (language == "Fr")
      language = "En";
    else
      language = "Fr";
  }

  static Future<void> translate() async {
    if (language == "Fr"){
      // App Bar
      work = "Travaux";
      about = "À propos";

      // Work - Presentation
      presentation = "Présentation";
      presentationText = await loadAsset('texts/presentation_fr.txt');

      // Work - My projects
      myProjects = "Mes projets";
      spimText = await loadAsset('texts/spim_fr.txt');

      // Work - projects I like
      otherProjects = "Des projets que j'aime";
      RandomFaceText = await loadAsset('texts/random_face_fr.txt');
      AppPainterText = await loadAsset('texts/app_painter_fr.txt');

      // Bottom
      sendEmail = "envoyer un courriel ";
      height = 100;
    }else if (language == "En"){
      // App Bar
      work = "Work";
      about = "About";

      // Work - Presentation
      presentation = "Presentation";
      presentationText = await loadAsset('texts/presentation_en.txt');

      // Work - My projects
      myProjects = "My works";
      spimText = await loadAsset('texts/spim_en.txt');

      // Work - projects I like
      otherProjects = "Projects I like";
      RandomFaceText = await loadAsset('texts/random_face_en.txt');
      AppPainterText = await loadAsset('texts/app_painter_en.txt');

      // Bottom
      sendEmail = "send email ";
      height = 200;
    }
  }
}
