class WeatherModel {
  final num temp;
  final num pressure;
  final num humidity;
  final num temp_max;
  final num temp_min;
  final num feels_like;
  final String city;

  WeatherModel(this.city,
      {required this.temp,
      required this.pressure,
      required this.humidity,
      required this.temp_max,
      required this.temp_min,
      required this.feels_like});

  double get getTemp => temp - 272.5;
  double get getMaxTemp => temp_max - 272.5;
  double get getMinTemp => temp_min - 272.5;

  factory WeatherModel.fromMap(Map json) {
    return WeatherModel(
      json['name'],
      temp: json['main']["temp"],
      pressure: json['main']["pressure"],
      humidity: json['main']["humidity"],
      temp_max: json['main']["temp_max"],
      temp_min: json['main']["temp_min"],
      feels_like: json['main']["feels_like"],
    );
  }
}
