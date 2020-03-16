class DailyData {
  var time;
  var summary;
  var icon;
  var sunriseTime;
  var sunsetTime;
  var moonPhase;
  var precipIntensity;
  var precipIntensityMax;
  var precipIntensityMaxTime;
  var precipProbability;
  var precipType;
  var temperatureHigh;
  var temperatureHighTime;
  var temperatureLow;
  var temperatureLowTime;
  var apparentTemperatureHigh;
  var apparentTemperatureHighTime;
  var apparentTemperatureLow;
  var apparentTemperatureLowTime;
  var dewPoint;
  var humidity;
  var pressure;
  var windSpeed;
  var windGust;
  var windGustTime;
  var windBearing;
  var cloudCover;
  var uvIndex;
  var uvIndexTime;
  var visibility;
  var ozone;
  var temperatureMin;
  var temperatureMinTime;
  var temperatureMax;
  var temperatureMaxTime;
  var apparentTemperatureMin;
  var apparentTemperatureMinTime;
  var apparentTemperatureMax;
  var apparentTemperatureMaxTime;

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
    moonPhase = json['moonPhase'];
    precipIntensity = json['precipIntensity'];
    precipIntensityMax = json['precipIntensityMax'];
    precipIntensityMaxTime = json['precipIntensityMaxTime'];
    precipProbability = json['precipProbability'];
    precipType = json['precipType'];
    temperatureHigh = json['temperatureHigh'];
    temperatureHighTime = json['temperatureHighTime'];
    temperatureLow = json['temperatureLow'];
    temperatureLowTime = json['temperatureLowTime'];
    apparentTemperatureHigh = json['apparentTemperatureHigh'];
    apparentTemperatureHighTime = json['apparentTemperatureHighTime'];
    apparentTemperatureLow = json['apparentTemperatureLow'];
    apparentTemperatureLowTime = json['apparentTemperatureLowTime'];
    dewPoint = json['dewPoint'];
    humidity = json['humidity'];
    pressure = json['pressure'];
    windSpeed = json['windSpeed'];
    windGust = json['windGust'];
    windGustTime = json['windGustTime'];
    windBearing = json['windBearing'];
    cloudCover = json['cloudCover'];
    uvIndex = json['uvIndex'];
    uvIndexTime = json['uvIndexTime'];
    visibility = json['visibility'];
    ozone = json['ozone'];
    temperatureMin = json['temperatureMin'];
    temperatureMinTime = json['temperatureMinTime'];
    temperatureMax = json['temperatureMax'];
    temperatureMaxTime = json['temperatureMaxTime'];
    apparentTemperatureMin = json['apparentTemperatureMin'];
    apparentTemperatureMinTime = json['apparentTemperatureMinTime'];
    apparentTemperatureMax = json['apparentTemperatureMax'];
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
