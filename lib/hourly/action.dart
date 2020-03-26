import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HourlyPageAction { action }

class HourlyPageActionCreator {
  static Action onAction() {
    return const Action(HourlyPageAction.action);
  }
}
