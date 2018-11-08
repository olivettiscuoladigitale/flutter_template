import 'dart:async';
import 'package:flutter/material.dart';
import 'Animation_Gesture/page_dragger.dart';
import 'Animation_Gesture/page_reveal.dart';
import 'UI/pager_indicator.dart';
import 'UI/pages.dart';
import '../../internazionalization/app_localization.dart';

class HomeSliderPage extends StatefulWidget {
  @override
  _HomeSliderPageState createState() => new _HomeSliderPageState();
}

class _HomeSliderPageState extends State<HomeSliderPage>
    with TickerProviderStateMixin {
  StreamController<SlideUpdate> slideUpdateStream;
  AnimatedPageDragger animatedPageDragger;
  int activeIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  int nextPageIndex = 0;
  double slidePercent = 0.0;
  List<PageViewModel> pages;

  getPages() {
    pages = [
      new PageViewModel(
          const Color(0xFF548CFF),
          'assets/images/intro/intro_1.png',
          AppLocalizations.of(context).trans('intro_slide1_title'),
          AppLocalizations.of(context).trans('intro_slide1_message'),
          'assets/images/intro/intro_1.png'),
      new PageViewModel(
          const Color(0xFFE4534D),
          'assets/images/intro/intro_2.png',
          AppLocalizations.of(context).trans('intro_slide2_title'),
          AppLocalizations.of(context).trans('intro_slide2_message'),
          'assets/images/intro/intro_2.png'),
      new PageViewModel(
        const Color(0xFFFF682D),
        'assets/images/intro/intro_3.png',
        AppLocalizations.of(context).trans('intro_slide3_title'),
        AppLocalizations.of(context).trans('intro_slide3_message'),
        'assets/images/intro/intro_3.png',
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    slideUpdateStream.close();
  }

  _HomeSliderPageState() {
    slideUpdateStream = new StreamController<SlideUpdate>();

    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = activeIndex + 1;
          } else {
            nextPageIndex = activeIndex;
          }
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
          } else {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        } else if (event.updateType == UpdateType.animating) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneAnimating) {
          activeIndex = nextPageIndex;

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getPages();

    return new Scaffold(
      body: new Stack(
        children: [
          new Page(
            viewModel: pages[activeIndex],
            percentVisible: 1.0,
          ),
          new PageReveal(
            revealPercent: slidePercent,
            child: new Page(
              viewModel: pages[nextPageIndex],
              percentVisible: slidePercent,
            ),
          ),
          SafeArea(
              child: new PagerIndicator(
            viewModel: new PagerIndicatorViewModel(
              pages,
              activeIndex,
              slideDirection,
              slidePercent,
            ),
          )),
          new PageDragger(
            canDragLeftToRight: activeIndex > 0,
            canDragRightToLeft: activeIndex < pages.length - 1,
            slideUpdateStream: this.slideUpdateStream,
          )
        ],
      ),
    );
  }
}
