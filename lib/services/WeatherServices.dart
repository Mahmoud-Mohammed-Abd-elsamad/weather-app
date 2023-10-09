import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weather_app/models/weatherModel.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "1c87e3175932453bbe0203546230507";

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

    http.Response response = await http.get(url);

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    WeatherModel weatherModel = WeatherModel(
        date:DateTime.parse(jsonResponse['location']['localtime'].toString()),
        image: jsonResponse['forecast']["forecastday"][0]["day"]["condition"]["icon"],
        temp: jsonResponse['forecast']["forecastday"][0]["day"]["avgtemp_c"],
        minTemp: jsonResponse['forecast']["forecastday"][0]["day"]["mintemp_c"],
        maxTemp: jsonResponse['forecast']["forecastday"][0]["day"]["maxtemp_c"],
        weatherState: jsonResponse['forecast']["forecastday"][0]["day"]
            ["condition"]["text"],
    cityName: jsonResponse["location"]["name"]);

    return weatherModel;
  }
}
