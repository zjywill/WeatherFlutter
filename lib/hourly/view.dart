import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    HourlyPageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text('Hourly'),
    ),
    body: Stack(
      children: <Widget>[
        Text(state.hourly.data[0].summary),
      ],
    ),
  );
}
