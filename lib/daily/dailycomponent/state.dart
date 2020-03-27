import 'package:WeatherFultter/model/pojo/DailyData.dart';
import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:fish_redux/fish_redux.dart';

class DailyComponentState implements Cloneable<DailyComponentState> {
  DailyData data;
  Hourly hourly;

  @override
  DailyComponentState clone() {
    return DailyComponentState()..data = data;
  }
}

DailyComponentState initState(Map<String, dynamic> args) {
  return DailyComponentState();
}
