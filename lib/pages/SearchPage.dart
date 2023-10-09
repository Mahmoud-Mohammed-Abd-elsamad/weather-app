import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
          style: TextStyle(color: Colors.white, fontSize: 21),
        ),
        backgroundColor: const Color(0xffefa03b),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  color: Colors.black,
                  onPressed: ()async {

                    BlocProvider.of<WeatherCubit>(context, listen: false).getWeather(BlocProvider.of<WeatherCubit>(context).cityName!) ;

                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                ),
                hintText: "Enter City Name"),
            onChanged: (data){
              BlocProvider.of<WeatherCubit>(context).cityName = data;
            },
            onSubmitted: (data) async {
              BlocProvider.of<WeatherCubit>(context).cityName  = data;

              BlocProvider.of<WeatherCubit>(context, listen: false).getWeather(BlocProvider.of<WeatherCubit>(context).cityName!);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
