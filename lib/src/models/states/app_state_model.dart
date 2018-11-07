// Copyright 2018 Olivetti. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:iana_mobile/src/resources/shared_pref_provider.dart';

class AppStateModel extends Model {
  SharedPrefProvider _sharedProvider = SharedPrefProvider();

  bool _hasIntroSlider = false;

  bool get hasIntroSlider => _hasIntroSlider;

  void setHasIntroSlider(bool value) {
    debugPrint('setHasIntroSlider to $value');
    _hasIntroSlider = value;
    _sharedProvider.setHasIntroSlider(value);

    notifyListeners();
  }


  loadAllPref() async {
    _hasIntroSlider = await _sharedProvider.hasIntroSlider();

    notifyListeners();
  }
}
