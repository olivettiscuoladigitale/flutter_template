// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>
//
// for more info on config: https://iirokrankka.com/2018/03/02/separating-build-environments/

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.supportedLocales,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final List<Locale> supportedLocales;

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
