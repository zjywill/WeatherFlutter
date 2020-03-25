import 'dart:developer';

import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DailyPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<DailyPageState>>{
      DailyPageAction.onPopulated: _onPopulated,
      DailyPageAction.refreshing: _refreshing,
    },
  );
}

DailyPageState _refreshing(DailyPageState state, Action action) {
  if (action.type == DailyPageAction.refreshing) {
    final DailyPageState newState = state.clone();
    newState.isLoading = true;
    return newState;
  }
  return state;
}

DailyPageState _onPopulated(DailyPageState state, Action action) {
  log("onPopulated action.type: " + action.type.toString());
  if (action.type == DailyPageAction.onPopulated) {
    final DailyPageState newState = state.clone();

    if (action.payload != null) {
      log("onPopulated action.payload: " + action.payload.toString());
      final Forecast forecast = action.payload ?? Forecast;
      newState.forecast = forecast;
    }
    newState.isLoading = false;
    return newState;
  }
  return state;
}
