import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DailyEmptyScreen extends StatelessWidget {
  DailyEmptyScreen();

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
