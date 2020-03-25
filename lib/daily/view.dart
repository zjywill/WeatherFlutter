import 'package:WeatherFultter/daily/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';

import 'state.dart';

Widget buildView(
    DailyPageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(state.isLoading ? "Loading" : state.forecast.timezone,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              )),
          Text(_buildAppbarSubtitle(state),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              )),
        ],
      ),
    ),
    body: Column(
      children: <Widget>[Text(state.isLoading ? "Loading" : "Empty")],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(DailyPageActionCreator.onRefresh()),
      tooltip: 'Add',
      child: const Icon(Icons.add),
    ),
  );
}

String _buildAppbarSubtitle(DailyPageState state) {
  if (!state.isLoading) {
    final localTime = new TZDateTime.from(
        DateTime.fromMillisecondsSinceEpoch(
            state.forecast.currently.time * 1000),
        getLocation(state.forecast.timezone));
    return DateFormat.MMMd().format(localTime) +
        ' ' +
        DateFormat.jm().format(localTime);
  }
  return "";
}
