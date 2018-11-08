// Copyright 2018 Olivetti. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../internazionalization/app_localization.dart';
import '../models/states/app_state_model.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
        builder: (context, child, model) {
      return Scaffold(
          appBar: AppBar(
              title: Text(AppLocalizations.of(context).trans('settings_title')),
              actions: <Widget>[]),
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              SwitchListTile(
                title: Text(AppLocalizations.of(context)
                    .trans('settings_list_intro_title')),
                subtitle: Text(AppLocalizations.of(context)
                    .trans('settings_list_intro_message')),
                value: !model.hasIntroSlider,
                onChanged: (bool value) {
                  model.setHasIntroSlider(!value);
                },
                //   secondary: const Icon(Icons.lightbulb_outline),
              ),
              Divider(),
            ],
          )));
    });
  }
}
