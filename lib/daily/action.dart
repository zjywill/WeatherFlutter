import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:fish_redux/fish_redux.dart';

enum DailyPageAction { onRefresh, refreshing, onPopulated, showHourly }

class DailyPageActionCreator {
  static Action onRefresh() {
    return const Action(DailyPageAction.onRefresh);
  }

  static Action refreshing() {
    return const Action(DailyPageAction.refreshing);
  }

  static Action onPopulated(Forecast forecast) {
    return Action(DailyPageAction.onPopulated, payload: forecast);
  }

  static Action showHourly(Hourly hourly) {
    return Action(DailyPageAction.showHourly, payload: hourly);
  }
}
