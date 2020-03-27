import 'package:WeatherFultter/daily/dailycomponent/component.dart';
import 'package:WeatherFultter/daily/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';

class DailyListAdapterAdapter extends SourceFlowAdapter<DailyPageState> {
  DailyListAdapterAdapter()
      : super(
          pool: <String, Component<Object>>{"daily": DailyComponentComponent()},
          reducer: buildReducer(),
        );
}
