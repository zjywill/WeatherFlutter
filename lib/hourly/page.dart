import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HourlyPagePage extends Page<HourlyPageState, Hourly> {
  HourlyPagePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HourlyPageState>(
              adapter: null, slots: <String, Dependent<HourlyPageState>>{}),
          middleware: <Middleware<HourlyPageState>>[],
        );
}
