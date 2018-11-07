// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:iana_mobile/src/pages/home.dart';
import 'package:iana_mobile/src/pages/spash.dart';
import 'package:iana_mobile/src/pages/slider_page/home_slider_page.dart';

/// application routes
Map<String, WidgetBuilder> appRoutes = {
  '/home': (BuildContext context) => Home(),
  "/intro": (BuildContext context) => HomeSliderPage(),
  "/": (BuildContext context) => Splash(),
};
