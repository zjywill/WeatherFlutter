import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:fish_redux/fish_redux.dart';

class DailyPageState implements Cloneable<DailyPageState> {
  bool isLoading = false;
  Forecast forecast;

  @override
  DailyPageState clone() {
    return DailyPageState();
  }
}

DailyPageState initState(Map<String, dynamic> args) {
  DailyPageState dailyPageState = DailyPageState();
  dailyPageState.isLoading = true;
  return dailyPageState;
}
