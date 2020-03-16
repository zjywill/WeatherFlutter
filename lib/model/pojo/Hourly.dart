import 'dart:developer';

import 'HourlyData.dart';

class Hourly {
  String summary;
  String icon;
  List<HourlyData> data;

  Hourly({this.summary, this.icon, this.data});

  Hourly.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    icon = json['icon'];
    if (json['data'] != null) {
      data = new List<HourlyData>();
      json['data'].forEach((v) {
        log('fromJson hourly data');
        data.add(new HourlyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['icon'] = this.icon;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
