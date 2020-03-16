import 'dart:developer';

class DailyData {
  int time;
  String summary;
  String icon;
  int sunriseTime;
  int sunsetTime;
  double moonPhase;
  double precipIntensity;
  double precipIntensityMax;
  int precipIntensityMaxTime;
  double precipProbability;
  String precipType;
  double temperatureHigh;
  int temperatureHighTime;
  double temperatureLow;
  int temperatureLowTime;
  double apparentTemperatureHigh;
  int apparentTemperatureHighTime;
  double apparentTemperatureLow;
  int apparentTemperatureLowTime;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windGustTime;
  double windBearing;
  double cloudCover;
  double uvIndex;
  int uvIndexTime;
  double visibility;
  double ozone;
  double temperatureMin;
  int temperatureMinTime;
  double temperatureMax;
  int temperatureMaxTime;
  double apparentTemperatureMin;
  int apparentTemperatureMinTime;
  double apparentTemperatureMax;
  int apparentTemperatureMaxTime;

  DailyData(
      {this.time,
      this.summary,
      this.icon,
      this.sunriseTime,
      this.sunsetTime,
      this.moonPhase,
      this.precipIntensity,
      this.precipIntensityMax,
      this.precipIntensityMaxTime,
      this.precipProbability,
      this.precipType,
      this.temperatureHigh,
      this.temperatureHighTime,
      this.temperatureLow,
      this.temperatureLowTime,
      this.apparentTemperatureHigh,
      this.apparentTemperatureHighTime,
      this.apparentTemperatureLow,
      this.apparentTemperatureLowTime,
      this.dewPoint,
      this.humidity,
      this.pressure,
      this.windSpeed,
      this.windGust,
      this.windGustTime,
      this.windBearing,
      this.cloudCover,
      this.uvIndex,
      this.uvIndexTime,
      this.visibility,
      this.ozone,
      this.temperatureMin,
      this.temperatureMinTime,
      this.temperatureMax,
      this.temperatureMaxTime,
      this.apparentTemperatureMin,
      this.apparentTemperatureMinTime,
      this.apparentTemperatureMax,
      this.apparentTemperatureMaxTime});

  DailyData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    summary = json['summary'];
    icon = json['icon'];
    sunriseTime = json['sunriseTime'];
    sunsetTime = json['sunsetTime'];
    moonPhase = json['moonPhase'].toDouble();
    precipIntensity = json['precipIntensity'].toDouble();
    precipIntensityMax = json['precipIntensityMax'].toDouble();
    precipIntensityMaxTime = json['precipIntensityMaxTime'];
    precipProbability = json['precipProbability'].toDouble();
    precipType = json['precipType'];
    temperatureHigh = json['temperatureHigh'].toDouble();
    temperatureHighTime = json['temperatureHighTime'];
    temperatureLow = json['temperatureLow'].toDouble();
    temperatureLowTime = json['temperatureLowTime'];
    apparentTemperatureHigh = json['apparentTemperatureHigh'].toDouble();
    apparentTemperatureHighTime = json['apparentTemperatureHighTime'];
    apparentTemperatureLow = json['apparentTemperatureLow'].toDouble();
    apparentTemperatureLowTime = json['apparentTemperatureLowTime'];
    dewPoint = json['dewPoint'].toDouble();
    humidity = json['humidity'].toDouble();
    pressure = json['pressure'].toDouble();
    windSpeed = json['windSpeed'].toDouble();
    windGust = json['windGust'].toDouble();
    windGustTime = json['windGustTime'];
    windBearing = json['windBearing'].toDouble();
    cloudCover = json['cloudCover'].toDouble();
    uvIndex = json['uvIndex'].toDouble();
    uvIndexTime = json['uvIndexTime'];
    visibility = json['visibility'].toDouble();
    ozone = json['ozone'].toDouble();
    temperatureMin = json['temperatureMin'].toDouble();
    temperatureMinTime = json['temperatureMinTime'];
    temperatureMax = json['temperatureMax'].toDouble();
    temperatureMaxTime = json['temperatureMaxTime'];
    apparentTemperatureMin = json['apparentTemperatureMin'].toDouble();
    apparentTemperatureMinTime = json['apparentTemperatureMinTime'];
    apparentTemperatureMax = json['apparentTemperatureMax'].toDouble();
    apparentTemperatureMaxTime = json['apparentTemperatureMaxTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['summary'] = this.summary;
    data['icon'] = this.icon;
    data['sunriseTime'] = this.sunriseTime;
    data['sunsetTime'] = this.sunsetTime;
    data['moonPhase'] = this.moonPhase;
    data['precipIntensity'] = this.precipIntensity;
    data['precipIntensityMax'] = this.precipIntensityMax;
    data['precipIntensityMaxTime'] = this.precipIntensityMaxTime;
    data['precipProbability'] = this.precipProbability;
    data['precipType'] = this.precipType;
    data['temperatureHigh'] = this.temperatureHigh;
    data['temperatureHighTime'] = this.temperatureHighTime;
    data['temperatureLow'] = this.temperatureLow;
    data['temperatureLowTime'] = this.temperatureLowTime;
    data['apparentTemperatureHigh'] = this.apparentTemperatureHigh;
    data['apparentTemperatureHighTime'] = this.apparentTemperatureHighTime;
    data['apparentTemperatureLow'] = this.apparentTemperatureLow;
    data['apparentTemperatureLowTime'] = this.apparentTemperatureLowTime;
    data['dewPoint'] = this.dewPoint;
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    data['windSpeed'] = this.windSpeed;
    data['windGust'] = this.windGust;
    data['windGustTime'] = this.windGustTime;
    data['windBearing'] = this.windBearing;
    data['cloudCover'] = this.cloudCover;
    data['uvIndex'] = this.uvIndex;
    data['uvIndexTime'] = this.uvIndexTime;
    data['visibility'] = this.visibility;
    data['ozone'] = this.ozone;
    data['temperatureMin'] = this.temperatureMin;
    data['temperatureMinTime'] = this.temperatureMinTime;
    data['temperatureMax'] = this.temperatureMax;
    data['temperatureMaxTime'] = this.temperatureMaxTime;
    data['apparentTemperatureMin'] = this.apparentTemperatureMin;
    data['apparentTemperatureMinTime'] = this.apparentTemperatureMinTime;
    data['apparentTemperatureMax'] = this.apparentTemperatureMax;
    data['apparentTemperatureMaxTime'] = this.apparentTemperatureMaxTime;
    return data;
  }
}
