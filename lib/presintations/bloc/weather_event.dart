part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final String city;

  GetWeather({required this.city});
}

class Search extends WeatherEvent {}


