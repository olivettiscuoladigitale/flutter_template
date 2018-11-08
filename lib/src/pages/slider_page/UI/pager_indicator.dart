import 'dart:ui' hide Image;
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'pages.dart';
import '../../../models/states/app_state_model.dart';
import '../../../internazionalization/app_localization.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PagerIndicator({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final appModel =
        ScopedModel.of<AppStateModel>(context, rebuildOnChange: true);

    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; ++i) {
      final page = viewModel.pages[i];

      var percentActive;

      if (i == viewModel.activeIndex) {
        percentActive = 1.0 - viewModel.slidePercent;
      } else if (i == viewModel.activeIndex - 1 &&
          viewModel.slideDirection == SlideDirection.leftToRight) {
        percentActive = viewModel.slidePercent;
      } else if (i == viewModel.activeIndex + 1 &&
          viewModel.slideDirection == SlideDirection.rightToLeft) {
        percentActive = viewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      bool isHollow = i > viewModel.activeIndex ||
          (i == viewModel.activeIndex &&
              viewModel.slideDirection == SlideDirection.leftToRight);

      bubbles.add(
        new PageBubble(
          viewModel: new PageBubbleViewModel(
            page.iconAssetPath,
            page.color,
            isHollow,
            percentActive,
          ),
        ),
      );
    }

    final BUBBLE_WIDHT = 35.0;
    final baseTranslation =
        ((viewModel.pages.length * BUBBLE_WIDHT) / 2) - (BUBBLE_WIDHT / 2);
    var translation = baseTranslation - (viewModel.activeIndex * BUBBLE_WIDHT);

    if (viewModel.slideDirection == SlideDirection.leftToRight) {
      translation += BUBBLE_WIDHT * viewModel.slidePercent;
    } else if (viewModel.slideDirection == SlideDirection.rightToLeft) {
      translation -= BUBBLE_WIDHT * viewModel.slidePercent;
    }

    return Stack(children: <Widget>[
      Positioned(
          bottom: 8.0,
          right: 5.0,
          child: Container(
              //  margin: const EdgeInsets.only(bottom: 0),
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                  onPressed: () {
                    appModel.setHasIntroSlider(true);

                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  child: Row(
                    children: <Widget>[
                      Text(AppLocalizations.of(context).trans('intro_start'),
                          style: Theme.of(context).primaryTextTheme.button),
                      IconTheme(
                          data: new IconThemeData(color: Colors.white),
                          child: Icon(
                            Icons.navigate_next,
                          ))
                    ],
                  )))),
      new Column(
        children: <Widget>[
          Expanded(child: Container()),
          Transform(
            transform: Matrix4.translationValues(translation, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bubbles,
            ),
          ),
        ],
      )
    ]);
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
      this.pages, this.activeIndex, this.slideDirection, this.slidePercent);
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewModel;

  PageBubble({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.0,
      height: 65.0,
      child: new Center(
        child: new Container(
          width: lerpDouble(15.0, 35.0, viewModel.activePercent),
          height: lerpDouble(15.0, 35.0, viewModel.activePercent),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? const Color(0x88FFFFFF)
                    .withAlpha(0x88 * viewModel.activePercent.round())
                : const Color(0x88FFFFFF),
            border: new Border.all(
              color: viewModel.isHollow
                  ? const Color(0x88FFFFFF).withAlpha(
                      (0x88 * (1.0 - viewModel.activePercent)).round())
                  : Colors.transparent,
              width: 3.0,
            ),
          ),
          child: new Opacity(
            opacity: viewModel.activePercent,
            child: Image.asset(
              viewModel.iconAssetPath,
              //color: viewModel.color, //
            ),
          ),
        ),
      ),
    );
  }
}

class PageBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
    this.iconAssetPath,
    this.color,
    this.isHollow,
    this.activePercent,
  );
}
