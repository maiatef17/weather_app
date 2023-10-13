import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class RemoteDs {
  Future<WeatherModel> getWeather(String city);
}

class RemoteDsImp implements RemoteDs {
  @override
  Future<WeatherModel> getWeather(String city) async {
    Response response = await get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      return WeatherModel.fromMap(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      throw Expando('failed to get Weather');
    }
  }
}
