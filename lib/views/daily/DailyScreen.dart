import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'DailyInitialScreen.dart';
import 'DailyState.dart';

class DailyScreen extends StatelessWidget {
  DailyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<DailyState, _DailyScreenViewModel>(
      converter: (store) {
        return _DailyScreenViewModel(
            state: store.state,
            onPressed: () {
              print("button pressed2");
              store.dispatch(DailyGetAction('40.7127', '-74.0059'));
            });
      },
      builder: (BuildContext context, _DailyScreenViewModel vm) {
        return Scaffold(
          body: Flex(direction: Axis.vertical, children: <Widget>[
            Container(
              color: Colors.brown,
              padding: EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 4.0),
              child: RaisedButton(
                child: Text("Forcast"),
                onPressed: () => vm.onPressed(),
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _buildVisible(vm.state),
              ),
            )
          ]),
        );
      },
    );
  }
}

Widget _buildVisible(DailyState state) {
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

class _DailyScreenViewModel {
  final DailyState state;
  final void Function() onPressed;

  _DailyScreenViewModel({this.state, this.onPressed});
}
