import 'package:WeatherFultter/model/pojo/DailyData.dart';
import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:flutter/material.dart';

class DailyPopulatedScreen extends StatelessWidget {
  final Forecast result;

  DailyPopulatedScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: result?.daily?.data?.length ?? 0,
      itemBuilder: (context, index) {
        final item = result.daily.data[index];
        return _DailyItem(item: item);
      },
    );
  }
}

class _DailyItem extends StatelessWidget {
  final DailyData item;

  const _DailyItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onWidgetTab,
      child: Container(child: Text(item.summary)),
    );
  }

  void _onWidgetTab() {}
}
