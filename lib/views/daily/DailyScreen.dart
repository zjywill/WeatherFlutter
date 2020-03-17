import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'DailyInitialScreen.dart';
import 'DailyState.dart';

class DailyScreen extends StatelessWidget {
  DailyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<DailyState, DailyScreenViewModel>(
      converter: (store) {
        return DailyScreenViewModel(
            state: store.state,
            onPressed: store.dispatch(DailyGetAction('40.7127', '-74.0059')));
      },
      builder: (BuildContext context, DailyScreenViewModel vm) {
        return Scaffold(
          body: Flex(direction: Axis.vertical, children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
              child: FlatButton(
                child: Text("forcast"),
                onPressed: () => vm.onPressed,
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: buildVisible(vm.state),
              ),
            )
          ]),
        );
      },
    );
  }
}

Widget buildVisible(DailyState state) {
  if (state is DailyLoading) {
    print("DailyLoading");
    return DailyInitialScreen();
  } else if (state is DailyEmpty) {
    print("DailyEmpty");
    return DailyInitialScreen();
  } else if (state is DailyPopulated) {
    print("DailyPopulated");
    return DailyInitialScreen();
  } else if (state is DailyInitial) {
    print("DailyInitial");
    return DailyInitialScreen();
  } else if (state is DailyError) {
    print("DailyError");
    return DailyInitialScreen();
  }

  throw ArgumentError('No view for state: $state');
}

class DailyScreenViewModel {
  final DailyState state;
  final void Function() onPressed;

  DailyScreenViewModel({this.state, this.onPressed});
}
