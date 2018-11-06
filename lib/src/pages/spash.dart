// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:iana_mobile/app_config.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

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
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
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
                        config.appName,
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                            color:
                                Theme.of(context).primaryTextTheme.body1.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 58.0),
                      )
                    ],
                  ),
                ),
              ),
              _loader(context),
            ],
          )
        ],
      ),
    );
  }

  _loader(BuildContext context) {
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
