import 'package:WeatherFultter/keys.dart';
import 'package:flutter/material.dart';

class HourlyScreen extends StatelessWidget {
  final void Function() onInit;

  HourlyScreen({@required this.onInit}) : super(key: ForecastKeys.hourly);

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
              "Empty",
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
