import 'package:WeatherFultter/views/daily/DailyScreen.dart';
import 'package:WeatherFultter/views/daily/DailyState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final store = Store<DailyState>(
    forecastReducer,
    initialState: DailyInitial(),
    middleware: [
      EpicMiddleware<DailyState>(DailyEpic()),
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
        home: DailyScreen(),
      ),
    );
  }
}
