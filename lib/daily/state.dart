import 'package:WeatherFultter/daily/dailycomponent/state.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:fish_redux/fish_redux.dart';

class DailyPageState extends MutableSource
    implements Cloneable<DailyPageState> {
  bool isLoading = false;
  Forecast forecast;
  List<DailyComponentState> list;

  @override
  DailyPageState clone() {
    return DailyPageState()
      ..isLoading = isLoading
      ..forecast = forecast
      ..list = list;
  }

  @override
  Object getItemData(int index) {
    return list[index];
  }

  @override
  String getItemType(int index) {
    return "daily";
  }

  @override
  int get itemCount => list?.length ?? 0;

  @override
  void setItemData(int index, Object data) {
    list[index] = data;
  }
}

DailyPageState initState(Map<String, dynamic> args) {
  final DailyPageState dailyPageState = DailyPageState();
  dailyPageState.isLoading = true;
  return dailyPageState;
}
