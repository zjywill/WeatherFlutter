import 'package:WeatherFultter/model/pojo/Hourly.dart';
import 'package:flutter/material.dart';

class HourlyScreen extends StatelessWidget {
  final Hourly hourly;

  HourlyScreen(this.hourly);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.info, color: Colors.white, size: 80.0),
          Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              hourly.data.first.summary,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
