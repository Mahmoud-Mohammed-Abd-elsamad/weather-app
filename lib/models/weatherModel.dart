import 'package:flutter/material.dart';

class WeatherModel{

  DateTime date;
  String image;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherState;
  String cityName;

  WeatherModel({
    required this.date,
    required this.image,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherState,
    required this.cityName}
      );

  String getImage(){
    if(weatherState == 'Clear'|| weatherState == 'Light Cloud'|| weatherState == 'Light cloud'|| weatherState == 'Sunny') {
      return 'assets/images/clear.png';
    }else if(weatherState == 'Sleet'|| weatherState == 'Snow'|| weatherState == 'Hail') {
      return 'assets/images/snow.png';
    }else if(weatherState == 'Heavy Cloud' || weatherState == 'Heavy cloud') {
      return 'assets/images/cloudy.png';
    }else if(weatherState == 'Light Rain'|| weatherState == 'Heavy Rain'|| weatherState == 'Heavy rain'|| weatherState == 'Showers') {
      return 'assets/images/rainy.png';
    }else if(weatherState == 'Thunderstorm'|| weatherState == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    }else {
      return 'assets/images/clear.png';
    }
    }

  MaterialColor getColor(){
    if(weatherState == 'Clear'|| weatherState == 'Light Cloud'|| weatherState == 'Sunny') {
      return Colors.orange ;
    }else if(weatherState == 'Sleet'|| weatherState == 'Snow'|| weatherState == 'Hail') {
      return Colors.blue;
    }else if(weatherState == 'Heavy Cloud') {
      return Colors.blue;
    }else if(weatherState == 'Light Rain'|| weatherState == 'Heavy Rain' || weatherState == 'Heavy rain'|| weatherState == 'Showers') {
      return Colors.blue;
    }else if(weatherState == 'Thunderstorm'|| weatherState == 'Thunder') {
      return Colors.yellow;
    }else {
      return Colors.blue;
    }
  }
  }
