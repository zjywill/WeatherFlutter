import 'package:WeatherFultter/model/api/DarkSkyApi.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
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

class DailyEpic implements EpicClass<DailyState> {
  @override
  Stream call(Stream actions, EpicStore<DailyState> store) {
    return actions
        .whereType<DailyGetAction>()
        .map((event) => forecast(event.latitude, event.longitude));
  }

  Stream<dynamic> forecast(String latitude, String longitude) async* {
    yield DailyLoadingAction();

    try {
      yield DailyResultAction(
          await DarkSkyApi.fetchForecast(latitude, longitude));
    } catch (e) {
      yield DailyErrorAction();
    }
  }
}
