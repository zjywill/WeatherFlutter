import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DailyComponentAction { action }

class DailyComponentActionCreator {
  static Action onAction() {
    return const Action(DailyComponentAction.action);
  }
}
