import 'Currently.dart';
import 'Daily.dart';
import 'Hourly.dart';

class Forecast {
  double latitude;
  double longitude;
  String timezone;
  Currently currently;
  Hourly hourly;
  Daily daily;
  int offset;

  Forecast(
      {this.latitude,
      this.longitude,
      this.timezone,
      this.currently,
      this.hourly,
      this.daily,
      this.offset});

  Forecast.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'].toDouble();
    longitude = json['longitude'].toDouble();
    timezone = json['timezone'];
    currently = json['currently'] != null
        ? new Currently.fromJson(json['currently'])
        : null;
    hourly =
        json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
    daily = json['daily'] != null ? new Daily.fromJson(json['daily']) : null;
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['timezone'] = this.timezone;
    if (this.currently != null) {
      data['currently'] = this.currently.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily.toJson();
    }
    data['offset'] = this.offset;
    return data;
  }
}
