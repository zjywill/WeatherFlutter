import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HourlyPageState> buildEffect() {
  return combineEffects(<Object, Effect<HourlyPageState>>{
    HourlyPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HourlyPageState> ctx) {
}
