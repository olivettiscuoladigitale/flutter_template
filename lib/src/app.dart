// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import '../app_config.dart';
import 'theme.dart';
import 'routes.dart';
import 'models/states/app_state_model.dart';
import 'internazionalization/app_localization_delegate.dart';
import 'utils/locale_resolution.dart';

class App extends StatelessWidget {
  final AppStateModel appStateModel;

  const App({Key key, this.appStateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return ScopedModel<AppStateModel>(
        model: appStateModel,
        child: MaterialApp(
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: config.supportedLocales,
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) =>
                  localeResolution(locale, supportedLocales),
          title: config.appName,
          theme: buildTheme(),
          routes: appRoutes,
        ));
  }
}
