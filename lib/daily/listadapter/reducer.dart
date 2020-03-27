import 'package:WeatherFultter/daily/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Reducer<DailyPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<DailyPageState>>{
      DailyListAdapterAction.action: _onAction,
    },
  );
}

DailyPageState _onAction(DailyPageState state, Action action) {
  final DailyPageState newState = state.clone();
  return newState;
}
