import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DailyComponentComponent extends Component<DailyComponentState> {
  DailyComponentComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DailyComponentState>(
                adapter: null,
                slots: <String, Dependent<DailyComponentState>>{
                }),);

}
