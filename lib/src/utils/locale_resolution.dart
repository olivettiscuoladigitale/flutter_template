// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';

localeResolution (Locale locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    debugPrint("*language locale is null!!!");
    return supportedLocales.first;
  }

  for (Locale supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode ||
        supportedLocale.countryCode == locale.countryCode) {
      debugPrint("*language ok $supportedLocale");
      return supportedLocale;
    }
  }

  debugPrint("*language to fallback ${supportedLocales.first}");
  return supportedLocales.first;
}