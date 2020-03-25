import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:fish_redux/fish_redux.dart';

enum DailyPageAction { onRefresh, refreshing, onPopulated }

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
}
