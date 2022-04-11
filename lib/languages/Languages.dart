
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Languages{
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
  static String otherProjectsText = "";

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
      otherProjectsText = await loadAsset('texts/random_face_fr.txt');
    }
    if (language == "En"){
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
      otherProjectsText = await loadAsset('texts/random_face_en.txt');
    }
  }
}