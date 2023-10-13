import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/remote_data.dart';

import 'package:weather_app/presintations/bloc/weather_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:weather_app/widgets/show_weather_widget.dart';
import 'package:weather_app/data/remote_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.title});

  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.withOpacity(1),
              Colors.lightBlue.withOpacity(0.8),
              Colors.grey.withOpacity(1),
            ],
          ),
        ),
        child:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          print(state);
          return Form(
              key: key,
              child: ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Container(
                    child: FlareActor(
                      "assets/WorldSpin.flr",
                      fit: BoxFit.contain,
                      animation: "roll",
                    ),
                    height: 300,
                    width: 300,
                  )),
                  if (state is WeatherInitialState)
                    Container(
                        padding: EdgeInsets.only(
                          left: 32,
                          right: 32,
                        ),
                        child: Column(children: <Widget>[
                          Text(
                            "Search Weather",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Instanly",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: cityController,
                            decoration: InputDecoration(
                              hintText: "Enter the City Name",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                                onPressed: () async {
                                  context.read<WeatherBloc>().add(
                                      GetWeather(city: cityController.text));
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.lightBlue)),
                                child: Text(
                                  'Search',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ]))
                  else if (state is WeatherLoadingState)
                    Center(child: CircularProgressIndicator())
                  else if (state is WeatherLoaded)
                    ShowWeatherWidget(
                        weather: state.weatherModel, city: cityController)
                ],
              ));
        }),
      ),
    );
  }
}
