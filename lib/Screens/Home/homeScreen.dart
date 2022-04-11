import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio/Screens/Home/Components/AppBar.dart';
import 'package:portfolio/Screens/Home/Components/WorkLayout.dart';
import 'package:portfolio/languages/Languages.dart';
import 'package:portfolio/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    // size provide total width and height of the navigator screen
    //Languages.translate().whenComplete(() => );
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body :Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/forestPath.jpg"),
                fit: BoxFit.cover,
                opacity: 0.2
            )
        ),
        child: Column(
          children: [
            CustomAppBar(
              changeLanguage: _changeLanguage,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child:WorkLayout(
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  _changeLanguage(){
    setState(() {Languages.changeLanguage();});
    Languages.translate().whenComplete(() {setState(() {});});
  }

  @override
  void initState() {
    super.initState();
    Languages.translate().whenComplete(() {
      setState(() {
      });
    });
  }
}
