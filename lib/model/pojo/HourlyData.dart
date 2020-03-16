import 'dart:developer';

class HourlyData {
  var time;
  var summary;
  var icon;
  var precipIntensity;
  var precipProbability;
  var precipType;
  var temperature;
  var apparentTemperature;
  var dewPoint;
  var humidity;
  var pressure;
  var windSpeed;
  var windGust;
  var windBearing;
  var cloudCover;
  var uvIndex;
  var visibility;
  var ozone;

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
    log('fromJson hourly data');
    time = json['time'];
    summary = json['summary'];
    icon = json['icon'];
    precipIntensity = json['precipIntensity'];
    precipProbability = json['precipProbability'];
    precipType = json['precipType'];
    temperature = json['temperature'];
    apparentTemperature = json['apparentTemperature'];
    dewPoint = json['dewPoint'];
    humidity = json['humidity'];
    pressure = json['pressure'];
    windSpeed = json['windSpeed'];
    windGust = json['windGust'];
    windBearing = json['windBearing'];
    cloudCover = json['cloudCover'];
    uvIndex = json['uvIndex'];
    visibility = json['visibility'];
    ozone = json['ozone'];
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
