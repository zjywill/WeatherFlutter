import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HourlyPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<HourlyPageState>>{
      HourlyPageAction.action: _onAction,
    },
  );
}

HourlyPageState _onAction(HourlyPageState state, Action action) {
  final HourlyPageState newState = state.clone();
  return newState;
}
