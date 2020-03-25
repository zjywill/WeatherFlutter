import 'package:WeatherFultter/routes.dart';
import 'package:WeatherFultter/views/daily/DailyScreen.dart';
import 'package:WeatherFultter/views/daily/DailyState.dart';
import 'package:WeatherFultter/views/hourly/HourlyScreen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'app.dart';

void main() {
  runApp(createApp());
}

class ForecastApp extends StatelessWidget {
  final Store<DailyState> store;

  ForecastApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forecast',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      routes: {
        ForecastRoutes.home: (context) {
          return DailyScreen();
        },
        ForecastRoutes.hourly: (context) {
          return HourlyScreen(ModalRoute.of(context).settings.arguments);
        },
      },
    );
  }
}
