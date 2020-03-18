import 'dart:async';
import 'dart:developer';

import 'package:WeatherFultter/model/api/DarkSkyApi.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

abstract class DailyState {}

class DailyInitial implements DailyState {}

class DailyLoading implements DailyState {}

class DailyEmpty implements DailyState {}

class DailyPopulated implements DailyState {
  final Forecast result;

  DailyPopulated(this.result);
}

class DailyError implements DailyState {}

class DailyGetAction {
  final String latitude;
  final String longitude;

  DailyGetAction(this.latitude, this.longitude);
}

class DailyLoadingAction {}

class DailyErrorAction {}

class DailyResultAction {
  final Forecast result;

  DailyResultAction(this.result);
}

final forecastReducer = combineReducers<DailyState>([
  TypedReducer<DailyState, DailyLoadingAction>(_onLoad),
  TypedReducer<DailyState, DailyErrorAction>(_onError),
  TypedReducer<DailyState, DailyResultAction>(_onResult),
]);

DailyState _onLoad(DailyState state, DailyLoadingAction action) =>
    DailyLoading();

DailyState _onError(DailyState state, DailyErrorAction action) => DailyError();

DailyState _onResult(DailyState state, DailyResultAction action) =>
    action.result.daily.data.isEmpty
        ? DailyEmpty()
        : DailyPopulated(action.result);

Stream<dynamic> dailyEpic(
    Stream<dynamic> actions, EpicStore<DailyState> store) {
  return actions
      .whereType<DailyGetAction>()
      .switchMap((action) => _forecast('40.7127', '-74.0059'));
}

Stream<dynamic> _forecast(String latitude, String longitude) async* {
  yield DailyLoadingAction();
  log('DailyLoadingAction Done');
  try {
    PermissionStatus permissionStatus = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    String latitude = '40.7127';
    String longitude = '-74.0059';
    if (permissionStatus == PermissionStatus.granted) {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    }
    log('forecast latitude: $latitude longitude: $longitude');
    yield DailyResultAction(
        await DarkSkyApi.fetchForecast(latitude, longitude));
  } catch (e) {
    yield DailyErrorAction();
  }
}
