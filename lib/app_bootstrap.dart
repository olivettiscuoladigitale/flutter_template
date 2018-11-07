// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:iana_mobile/src/app.dart';
import 'package:flutter/services.dart';
import 'package:iana_mobile/src/models/states/app_state_model.dart';

class AppBootstrap {
  App getApp() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return App(
      appStateModel: AppStateModel()
    );
  }
}
