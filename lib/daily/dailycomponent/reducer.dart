import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DailyComponentState> buildReducer() {
  return asReducer(
    <Object, Reducer<DailyComponentState>>{
      DailyComponentAction.action: _onAction,
    },
  );
}

DailyComponentState _onAction(DailyComponentState state, Action action) {
  final DailyComponentState newState = state.clone();
  return newState;
}
