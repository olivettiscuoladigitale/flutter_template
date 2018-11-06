// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:iana_mobile/app_config.dart';
import 'package:iana_mobile/src/theme.dart';
import 'package:iana_mobile/src/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return MaterialApp(
      title: config.appName,
      theme: buildTheme(),
      routes: appRoutes,
    );
  }
}
