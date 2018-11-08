// Copyright 2018 Olivetti. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../app_config.dart';
import '../models/states/app_state_model.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AppConfig appConfig;

  @override
  void initState() {
    super.initState();
    onInitPlatform();
  }

  void onInitPlatform() async {
    final appModel =
        ScopedModel.of<AppStateModel>(context, rebuildOnChange: false);

    // load all data shared_preference at start
    await appModel.loadAllPref();

    String nextRouteName = appModel.hasIntroSlider == true ? '/home' : '/intro';
    // startTime('/intro');
    startTime(nextRouteName);
  }

  void startTime(String routeName) async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Duration duration = Duration(seconds: 1);
      Timer(duration, () => navigationPage(routeName));
    });
  }

  void navigationPage(String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 2, child: Container(child: _logoNameTop())),
              _loader(),
            ],
          )
        ],
      ),
    );
  }

  _logoNameTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /*
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    ExactAssetImage('assets/splash/icon.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 2.0,
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                      ),*/
        Text(
          appConfig.appName,
          style: TextStyle(
              fontFamily: 'Pacifico',
              color: Theme.of(context).primaryTextTheme.body1.color,
              fontWeight: FontWeight.bold,
              fontSize: 58.0),
        )
      ],
    );
  }

  _loader() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Text(
            'Loading..',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Theme.of(context).primaryTextTheme.body1.color),
          )
        ],
      ),
    );
  }
}
