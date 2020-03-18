import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:WeatherFultter/model/pojo/Forecast.dart';
import 'package:http/http.dart' as http;

class DarkSkyApi {
//  Future<http.Response> fetchForecast() {
//    return http.get(
//        'https://api.darksky.net/forecast/14ecc9a31114895968a05c70cf5be1a9/37.8267,-122.4233?exclude=minutely,alerts,flags&units=ca');
//  }

  static Future<Forecast> fetchForecast(latitude, longitude) async {
    log('latitude: $latitude,longitude: $longitude');
    final response = await http.get(
        'https://api.darksky.net/forecast/14ecc9a31114895968a05c70cf5be1a9/$latitude,$longitude?exclude=minutely,alerts,flags&units=ca');
    log('fetchForecast response $response');
    if (response.statusCode == 200) {
      log('fetchForecast response 200');
      return Forecast.fromJson(json.decode(response.body));
    } else {
      log('fetchForecast Failed');
      throw Exception('Failed to load forecast');
    }
  }
}
