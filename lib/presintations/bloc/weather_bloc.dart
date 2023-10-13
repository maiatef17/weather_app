import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/remote_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeather) {
        print('weather');
        emit(WeatherLoadingState());
        WeatherModel weather = await RemoteDsImp().getWeather(event.city);
        emit(WeatherLoaded(weatherModel: weather));
      }
      if (event is Search) {
        emit(WeatherInitialState());
      }
    });
  }
}
