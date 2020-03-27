import 'package:WeatherFultter/daily/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    DailyComponentState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: InkWell(
      onTap: () => dispatch(DailyPageActionCreator.showHourly(state.hourly)),
      child: Card(
          margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Column(
            children: <Widget>[
              Text(state.data.summary),
              Image(
                width: 64,
                height: 64,
                image: AssetImage('images/Sunny.png'),
              )
            ],
          )),
    ),
  );
}
