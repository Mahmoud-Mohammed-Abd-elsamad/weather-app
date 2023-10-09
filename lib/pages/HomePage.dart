import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/weatherModel.dart';

import 'SearchPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(title: const Text("Weather",style: TextStyle(color: Colors.white),),
        actions:[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return const SearchPage();
                }),
              );
            },
          )

        ],),

      body: BlocBuilder<WeatherCubit,WeatherState>(builder: (BuildContext context, state) {
        WeatherModel? weatherData = BlocProvider.of<WeatherCubit>(context,listen: true).weatherModel;

        if(state is WeatherStateLoding){
          return const Center(child:CircularProgressIndicator(),);
        }else if(state is WeatherStateSuccess){
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  weatherData!.getColor().shade800,
                  weatherData!.getColor().shade500,
                  weatherData!.getColor().shade200,
                ],
              ),),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                Text(weatherData!.cityName,style: const TextStyle(fontSize: 32),),
                Text("Updated : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}"
                  ,style: const TextStyle(fontSize: 16),),
                const Spacer(flex: 1,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(weatherData!.getImage()),
                    const Text("30",style: TextStyle(fontSize: 32),),
                    Column(children: [
                      Text("max ${weatherData!.maxTemp}",style: const TextStyle(fontSize: 16),),
                      Text("min ${weatherData!.minTemp} ",style: const TextStyle(fontSize: 16),),
                    ],)
                  ],),
                const Spacer(flex: 1,),
                Text(weatherData!.weatherState,style: const TextStyle(fontSize: 32),),
                const Spacer(flex: 5,),
              ],),
          );
        }else if(state is WeatherStateFailur){return
            const Center(child: Text(" some theing want wrong try agaun"),);
        }else{
          return const Padding(
            padding: EdgeInsets.all(8),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("there is no weather start 😔 \n       searching now🔎 ",style: TextStyle(
                  fontSize:28,
                ),)
              ],),
          );

      }
      },
      ),
    );

  }}
