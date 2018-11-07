// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:iana_mobile/app_config.dart';
import 'package:iana_mobile/app_bootstrap.dart';

void main() {
  final app = AppBootstrap().getApp();

  AppConfig configuredApp = AppConfig(
      appName: 'IAna',
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('it', 'IT'), // Italian
      ],
      child: app);

  runApp(configuredApp);
}