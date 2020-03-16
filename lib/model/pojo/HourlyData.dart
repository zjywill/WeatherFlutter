import 'dart:developer';

class HourlyData {
  int time;
  String summary;
  String icon;
  double precipIntensity;
  double precipProbability;
  String precipType;
  double temperature;
  double apparentTemperature;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  double windBearing;
  double cloudCover;
  double uvIndex;
  double visibility;
  double ozone;

  HourlyData(
      {this.time,
      this.summary,
      this.icon,
      this.precipIntensity,
      this.precipProbability,
      this.precipType,
      this.temperature,
      this.apparentTemperature,
      this.dewPoint,
      this.humidity,
      this.pressure,
      this.windSpeed,
      this.windGust,
      this.windBearing,
      this.cloudCover,
      this.uvIndex,
      this.visibility,
      this.ozone});

  HourlyData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    summary = json['summary'];
    icon = json['icon'];
    precipIntensity = json['precipIntensity'].toDouble();
    precipProbability = json['precipProbability'].toDouble();
    precipType = json['precipType'];
    temperature = json['temperature'].toDouble();
    apparentTemperature = json['apparentTemperature'].toDouble();
    dewPoint = json['dewPoint'].toDouble();
    humidity = json['humidity'].toDouble();
    pressure = json['pressure'].toDouble();
    windSpeed = json['windSpeed'].toDouble();
    windGust = json['windGust'].toDouble();
    windBearing = json['windBearing'].toDouble();
    cloudCover = json['cloudCover'].toDouble();
    uvIndex = json['uvIndex'].toDouble();
    visibility = json['visibility'].toDouble();
    ozone = json['ozone'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['summary'] = this.summary;
    data['icon'] = this.icon;
    data['precipIntensity'] = this.precipIntensity;
    data['precipProbability'] = this.precipProbability;
    data['precipType'] = this.precipType;
    data['temperature'] = this.temperature;
    data['apparentTemperature'] = this.apparentTemperature;
    data['dewPoint'] = this.dewPoint;
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    data['windSpeed'] = this.windSpeed;
    data['windGust'] = this.windGust;
    data['windBearing'] = this.windBearing;
    data['cloudCover'] = this.cloudCover;
    data['uvIndex'] = this.uvIndex;
    data['visibility'] = this.visibility;
    data['ozone'] = this.ozone;
    return data;
  }
}
