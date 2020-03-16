import 'DailyData.dart';

class Daily {
  String summary;
  String icon;
  List<DailyData> data;

  Daily({this.summary, this.icon, this.data});

  Daily.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    icon = json['icon'];
    if (json['data'] != null) {
      data = new List<DailyData>();
      json['data'].forEach((v) {
        data.add(new DailyData.fromJson(v));
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
