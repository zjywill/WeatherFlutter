import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

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
              store.dispatch(DailyGetAction());
            });
      },
      builder: (BuildContext context, _DailyScreenViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.location_searching,
              color: Colors.white,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_buildAppbarTitle(vm.state),
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
                Text(_buildAppbarSubtitle(vm.state),
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
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

String _buildAppbarTitle(DailyState state) {
  if (state is DailyLoading) {
    print("DailyLoading");
    return "Loading";
  } else if (state is DailyEmpty) {
    print("DailyEmpty");
    return "Empty";
  } else if (state is DailyPopulated) {
    print("DailyPopulated");
    return state.result.timezone;
  } else if (state is DailyInitial) {
    print("DailyInitial");
    return "";
  } else if (state is DailyError) {
    print("DailyError");
    return "Empty";
  }

  throw ArgumentError('No view for state: $state');
}

String _buildAppbarSubtitle(DailyState state) {
  if (state is DailyLoading) {
    return " ";
  } else if (state is DailyEmpty) {
    return " ";
  } else if (state is DailyPopulated) {
    final localTime = new TZDateTime.from(
        DateTime.fromMillisecondsSinceEpoch(state.result.currently.time * 1000),
        state.timezone);
    return DateFormat.MMMd().format(localTime) + ' '+DateFormat.jm().format(localTime);
  } else if (state is DailyInitial) {
    return "";
  } else if (state is DailyError) {
    return " ";
  }

  throw ArgumentError('No view for state: $state');
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
