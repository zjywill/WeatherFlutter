import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:fish_redux/fish_redux.dart';

class HourlyPageState implements Cloneable<HourlyPageState> {
  Hourly hourly;

  @override
  HourlyPageState clone() {
    return HourlyPageState()..hourly = hourly;
  }
}

HourlyPageState initState(Hourly hourly) {
  final HourlyPageState hourlyPageState = HourlyPageState();
  hourlyPageState.hourly = hourly;
  return hourlyPageState;
}
