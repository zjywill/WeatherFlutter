import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:fish_redux/fish_redux.dart';

class DailyPageState implements Cloneable<DailyPageState> {
  bool isLoading = false;
  Forecast forecast;

  @override
  DailyPageState clone() {
    return DailyPageState()
      ..isLoading = isLoading
      ..forecast = forecast;
  }
}

DailyPageState initState(Map<String, dynamic> args) {
  final DailyPageState dailyPageState = DailyPageState();
  dailyPageState.isLoading = true;
  return dailyPageState;
}
