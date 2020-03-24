import 'package:WeatherFultter/model/pojo/DailyData.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:WeatherFultter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:timezone/timezone.dart';

import '../../keys.dart';
import 'DailyEmtpyScreen.dart';
import 'DailyState.dart';

class DailyScreen extends StatelessWidget {
  final Store<DailyState> store = Store<DailyState>(
    forecastReducer,
    initialState: DailyInitial(),
    middleware: [
      EpicMiddleware<DailyState>(dailyEpic),
    ],
  );

  DailyScreen() : super(key: ForecastKeys.home);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<DailyState>(
      store: store,
      child: DailyScreenSub(store),
    );
  }
}

class DailyScreenSub extends StatefulWidget {
  final Store<DailyState> store;

  DailyScreenSub(this.store) : super() {
    store.dispatch(DailyGetAction());
  }

  @override
  State<StatefulWidget> createState() {
    return DailyScreenState();
  }
}

class DailyScreenState extends State<DailyScreenSub> {
  Forecast _forecast;
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = new RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<DailyState, _DailyScreenViewModel>(
      converter: (store) {
        return _DailyScreenViewModel(
            state: store.state,
            onRefresh: () {
              print("button pressed2");
              store.dispatch(DailyGetAction());
            });
      },
      onDidChange: (store) {
        print("onDidChange: $store");
        setState(() {
          DailyState state = store.state;
          if (state is DailyPopulated) {
            _forecast = state.result;
          }
        });
      },
      builder: (BuildContext context, _DailyScreenViewModel vm) {
        return Scaffold(
          appBar: AppBar(
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
          body: Stack(
            children: <Widget>[
              SmartRefresher(
                controller: _refreshController,
                onRefresh: vm.onRefresh,
                child: ListView.builder(
                    itemCount: _forecast?.daily?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var item = _forecast.daily.data[index];
                      return _DailyItem(
                        item: item,
                        hourly: _forecast.hourly,
                      );
                    }),
              ),
              Visibility(
                child: DailyEmptyScreen(),
                visible: vm.state is DailyEmpty ? true : false,
              ),
            ],
          ),
        );
      },
    );
  }

  String _buildAppbarTitle(DailyState state) {
    if (state is DailyLoading) {
      return "Loading";
    } else if (state is DailyEmpty) {
      _refreshController.refreshCompleted();
      return "Empty";
    } else if (state is DailyPopulated) {
      _refreshController.refreshCompleted();
      return state.result.timezone;
    } else if (state is DailyInitial) {
      return "";
    } else if (state is DailyError) {
      _refreshController.refreshCompleted();
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
          DateTime.fromMillisecondsSinceEpoch(
              state.result.currently.time * 1000),
          state.timezone);
      return DateFormat.MMMd().format(localTime) +
          ' ' +
          DateFormat.jm().format(localTime);
    } else if (state is DailyInitial) {
      return "";
    } else if (state is DailyError) {
      return " ";
    }

    throw ArgumentError('No view for state: $state');
  }
}

class _DailyScreenViewModel {
  final DailyState state;
  final void Function() onRefresh;

  _DailyScreenViewModel({this.state, this.onRefresh});
}

class _DailyItem extends StatelessWidget {
  final DailyData item;
  final Hourly hourly;

  const _DailyItem({Key key, @required this.item, this.hourly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onWidgetTab(context);
      },
      child: Container(child: Text(item.summary)),
    );
  }

  void _onWidgetTab(BuildContext context) {
    Navigator.pushNamed(context, ForecastRoutes.hourly, arguments: hourly);
  }
}
