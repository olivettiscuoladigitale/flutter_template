import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF548CFF),
      'assets/images/intro/intro_1.png',
      'Visita il meglio',
      'Vivi una fantastica avventura',
      'assets/images/intro/intro_1.png'),
  new PageViewModel(
      const Color(0xFFE4534D),
      'assets/images/intro/intro_1.png',
      'Trova un punto di interesse',
      'Trova una piazza o un monumento e scorpi il percorsi',
      'assets/images/intro/intro_1.png'),
  new PageViewModel(
    const Color(0xFFFF682D),
    'assets/images/intro/intro_1.png',
    'Lasciati guidare',
    'Prendi il percorso più vicino a te, e scopri l itinerario',
    'assets/images/intro/intro_1.png',
  ),
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
        color: viewModel.color,
        child: new Opacity(
          opacity: percentVisible,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 25.0),
                    child: new Image.asset(viewModel.heroAssetPath,
                        width: 200.0, height: 150.0),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    child: new Text(
                      viewModel.title,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'FlamanteRoma',
                        fontSize: 34.0,
                      ),
                    ),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 45.0),
                    child: new Text(
                      viewModel.body,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'FlamanteRomaItalic',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}
