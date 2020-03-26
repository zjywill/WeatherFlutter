import 'dart:async';
import 'dart:developer';

import 'package:WeatherFultter/model/api/DarkSkyApi.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:geolocator/geolocator.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'action.dart';
import 'state.dart';

Effect<DailyPageState> buildEffect() {
  return combineEffects(<Object, Effect<DailyPageState>>{
    Lifecycle.initState: _init,
    DailyPageAction.onRefresh: _onRefresh,
    DailyPageAction.showHourly: _showHourly,
  });
}

void _init(Action action, Context<DailyPageState> ctx) async {
  log("Effect _init action type: " + action.type.toString());
  ctx.dispatch(DailyPageActionCreator.onPopulated(await getForecast()));
}

void _onRefresh(Action action, Context<DailyPageState> ctx) async {
  log("Effect _onRefresh");
  ctx.dispatch(DailyPageActionCreator.refreshing());
  ctx.dispatch(DailyPageActionCreator.onPopulated(await getForecast()));
}

void _showHourly(Action action, Context<DailyPageState> ctx) {
  if (action.payload != null) {
    log("_showHourly action.payload: " + action.payload.toString());
    final Hourly hourly = action.payload ?? Hourly;
    Navigator.of(ctx.context)
        .pushNamed('hourly_page', arguments: action.payload);
  }
}

Future<Forecast> getForecast() async {
  tz.initializeTimeZones();

  String latitude = '40.7127';
  String longitude = '-74.0059';
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  latitude = position.latitude.toString();
  longitude = position.longitude.toString();

  log('forecast latitude: $latitude longitude: $longitude');
  var forecast = await DarkSkyApi().fetchForecast(latitude, longitude);
  log('forecast got: $forecast');
  return forecast;
}
