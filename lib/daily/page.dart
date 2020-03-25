import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DailyPagePage extends Page<DailyPageState, Map<String, dynamic>> {
  DailyPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DailyPageState>(
                adapter: null,
                slots: <String, Dependent<DailyPageState>>{
                }),
            middleware: <Middleware<DailyPageState>>[
            ],);

}
