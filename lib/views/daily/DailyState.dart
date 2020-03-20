import 'dart:async';
import 'dart:developer';

import 'package:WeatherFultter/model/api/DarkSkyApi.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

abstract class DailyState {}

class DailyInitial implements DailyState {}

class DailyLoading implements DailyState {}

class DailyEmpty implements DailyState {}

class DailyPopulated implements DailyState {
  final Forecast result;
  final Location timezone;

  DailyPopulated(this.result, this.timezone);
}

class DailyError implements DailyState {}

class DailyGetAction {}

class DailyLoadingAction {}

class DailyErrorAction {}

class DailyResultAction {
  final Forecast result;
  final Location timezone;

  DailyResultAction(this.result, this.timezone);
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
    action.result?.daily?.data?.isEmpty??true
        ? DailyEmpty()
        : DailyPopulated(action.result, action.timezone);

Stream<dynamic> dailyEpic(
    Stream<dynamic> actions, EpicStore<DailyState> store) {
  return actions.whereType<DailyGetAction>().switchMap((action) => _forecast());
}

Stream<dynamic> _forecast() async* {
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
    var forecast = await DarkSkyApi().fetchForecast(latitude, longitude);

    tz.initializeTimeZones();
    var timezone = getLocation(forecast.timezone);

    yield DailyResultAction(forecast, timezone);
  } catch (e) {
    log("error $e");
    yield DailyErrorAction();
  }
}
