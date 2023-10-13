import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/remote_data.dart';
import 'package:weather_app/presintations/bloc/weather_bloc.dart';
import 'package:weather_app/presintations/pages/search_screen.dart';


void main() {
  runApp(BlocProvider(
    create: (context) => WeatherBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SearchPage(title: 'Weather'),
    );
  }
}


