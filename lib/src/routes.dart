// Copyright 2018 Olivetti. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/spash.dart';
import 'pages/slider_page/home_slider_page.dart';
import 'pages/settings.dart';

/// application routes
Map<String, WidgetBuilder> appRoutes = {
  '/home': (BuildContext context) => Home(),
  "/intro": (BuildContext context) => HomeSliderPage(),
  "/": (BuildContext context) => Splash(),
  "/settings": (BuildContext context) => Settings()
};
