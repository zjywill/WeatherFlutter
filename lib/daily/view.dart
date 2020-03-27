import 'package:WeatherFultter/daily/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timezone/timezone.dart';

import 'state.dart';

class DailyView {
  RefreshController _refreshController;

  DailyView() {
    _refreshController = new RefreshController();
  }

  Widget buildView(
      DailyPageState state, Dispatch dispatch, ViewService viewService) {
    if (state.forecast != null) {
      _refreshController.refreshCompleted();
    }
    final ListAdapter adapter = viewService.buildAdapter();
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
              itemCount: adapter.itemCount,
              itemBuilder: adapter.itemBuilder,
            ),
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
