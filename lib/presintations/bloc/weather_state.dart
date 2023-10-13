part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}
