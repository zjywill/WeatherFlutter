import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DailyListAdapterAction { action }

class DailyListAdapterActionCreator {
  static Action onAction() {
    return const Action(DailyListAdapterAction.action);
  }
}
