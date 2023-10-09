import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/HomePage.dart';

import 'package:weather_app/services/WeatherServices.dart';

import 'cubit/weather_cubit.dart';


void main() {
  runApp( BlocProvider(create: (BuildContext context) { return WeatherCubit(weatherServices: WeatherServices()); },
  child
      : const WeatherApp()));
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme:ThemeData(
            primarySwatch:BlocProvider.of<WeatherCubit>(context).weatherModel?.getColor(),
            //brightness: Brightness.dark,
          ),

          debugShowCheckedModeBanner: false,
          home: const HomePage()
        );

  }
}
