import 'package:WeatherFultter/daily/action.dart';
import 'package:WeatherFultter/model/pojo/DailyData.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timezone/timezone.dart';

import 'state.dart';

class DailyView {
  Forecast _forecast;
  RefreshController _refreshController;

  DailyView() {
    _refreshController = new RefreshController();
  }

  Widget buildView(
      DailyPageState state, Dispatch dispatch, ViewService viewService) {
    if (state.forecast != null) {
      _forecast = state.forecast;
      _refreshController.refreshCompleted();
    }
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
      body: Stack(
        children: <Widget>[
          SmartRefresher(
            controller: _refreshController,
            onRefresh: () => dispatch(DailyPageActionCreator.onRefresh()),
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
        ],
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
      child: Card(
          margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Column(
            children: <Widget>[
              Text(item.summary),
              Image(
                width: 64,
                height: 64,
                image: AssetImage('images/Sunny.png'),
              )
            ],
          )),
    );
  }

  void _onWidgetTab(BuildContext context) {}
}
