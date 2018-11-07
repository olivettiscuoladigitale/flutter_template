// Copyright 2018 Olivetti. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:iana_mobile/src/models/states/app_state_model.dart';
import 'package:scoped_model/scoped_model.dart';


class Intro extends StatefulWidget {
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Slide> slides = new List();
   AppStateModel appModel;


  @override
  void initState() {
    initSlides();
    super.initState();
    appModel = ScopedModel.of<AppStateModel>(context, rebuildOnChange: false);
  }



  initSlides() {
    slides.add(
      new Slide(
        title: "ERASER",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/intro/intro_1.png",
        backgroundColor: 0xfff5a623,
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        pathImage: "assets/images/intro/intro_2.png",
        backgroundColor: 0xff203152,
      ),
    );
    slides.add(
      new Slide(
        title: "RULER",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "assets/images/intro/intro_3.png",
        backgroundColor: 0xff9932CC,
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
    appModel.setHasIntroSlider(true);
    goToHome();
  }

  void onSkipPress() {
    // TODO: go to next screen

    goToHome();
  }

  void goToHome() {
    appModel.setHasIntroSlider(true);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
