import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'listadapter/adapter.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DailyPagePage extends Page<DailyPageState, Map<String, dynamic>> {
  DailyPagePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: DailyView().buildView,
          dependencies: Dependencies<DailyPageState>(
              adapter: NoneConn<DailyPageState>() + DailyListAdapterAdapter(),
              slots: <String, Dependent<DailyPageState>>{}),
          middleware: <Middleware<DailyPageState>>[],
        );
}
