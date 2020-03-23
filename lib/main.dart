import 'package:WeatherFultter/routes.dart';
import 'package:WeatherFultter/views/daily/DailyScreen.dart';
import 'package:WeatherFultter/views/daily/DailyState.dart';
import 'package:WeatherFultter/views/hourly/HourlyScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final store = Store<DailyState>(
    forecastReducer,
    initialState: DailyInitial(),
    middleware: [
      EpicMiddleware<DailyState>(dailyEpic),
    ],
  );

  runApp(ForecastApp(
    store: store,
  ));
}

class ForecastApp extends StatelessWidget {
  final Store<DailyState> store;

  ForecastApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<DailyState>(
      store: store,
      child: MaterialApp(
        title: 'Forecast',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
        ),
        routes: {
          ForecastRoutes.home: (context) {
            return DailyScreen(
              onInit: store.dispatch(new DailyGetAction()),
            );
          },
          ForecastRoutes.hourly: (context) {
            return HourlyScreen(
              onInit: store.dispatch(new DailyGetAction()),
            );
          },
        },
      ),
    );
  }
}
