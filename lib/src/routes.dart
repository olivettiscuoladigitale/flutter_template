// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:iana_mobile/src/pages/home.dart';
import 'package:iana_mobile/src/pages/intro.dart';
import 'package:iana_mobile/src/pages/spash.dart';

/// application routes
Map<String, WidgetBuilder> appRoutes = {
  '/home': (BuildContext context) => Home(),
  "/intro": (BuildContext context) => Intro(),
  "/": (BuildContext context) => Splash(),
};
