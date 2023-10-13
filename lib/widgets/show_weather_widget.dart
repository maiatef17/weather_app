import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/models/weather_model.dart';

import 'package:weather_app/presintations/bloc/weather_bloc.dart';

class ShowWeatherWidget extends StatelessWidget {
  ShowWeatherWidget({super.key, required this.weather, required this.city});
  WeatherModel weather;
  final city;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  weather.city,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  weather.getTemp.round().toString() + "°C",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Text(
                  "Temprature",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/14.png',
                      scale: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          weather.getMinTemp.round().toString() + "°C",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          "Min Temprature",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/13.png',
                          scale: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              weather.getMaxTemp.round().toString() + "°C",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "Max Temprature",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () async {
                        context.read<WeatherBloc>().add(Search());
                        city.clear();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlue)),
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ));
      },
    );
  }
}
