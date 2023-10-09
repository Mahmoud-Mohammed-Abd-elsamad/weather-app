import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/WeatherServices.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit({required this.weatherServices}) : super(WeatherStateInitial());

  String? cityName;
  WeatherModel? weatherModel;
  WeatherServices weatherServices;
  void getWeather(String cityName) async{
     emit(WeatherStateLoding());
    try{


      weatherModel =  await weatherServices.getWeather(cityName: cityName);
      emit(WeatherStateSuccess());
    }catch(ex){
      emit(WeatherStateFailur());
    }

  }


}