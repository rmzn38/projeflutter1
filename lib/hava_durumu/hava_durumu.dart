import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'lokasyon.dart';



const apiKey = "52713842d48a7b12f8a0c8d2bac71f88";

class WeatherDisplayData{
  Icon weatherIcon;
  WeatherDisplayData({@required this.weatherIcon});
}


class WeatherData{
  WeatherData({@required this.locationData});

  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;
  String city;

  Future<void> getCurrentTemperature() async{
    Response response = await get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?lat=38.734802&lon=35.467987&appid=52713842d48a7b12f8a0c8d2bac71f88&units=metric"));
    if(response.statusCode == 200){
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try{
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
      }catch(e){

      }

    }


  }

  WeatherDisplayData getWeatherDisplayData(){
    if(currentCondition <600){
      //hava bulutlu
      return WeatherDisplayData(
          weatherIcon: Icon(
              FontAwesomeIcons.cloud,
              size: 75.0,
              color:Colors.blue
          ),
          );
    }
    else{
      //hava iyi
      //gece gündüz kontrolü
      var now = new DateTime.now();
      if(now.hour >=19){
        return WeatherDisplayData(
            weatherIcon: Icon(
                FontAwesomeIcons.moon,
                size: 75.0,
                color:Colors.black
            ),
            );
      }else{
        return WeatherDisplayData(
            weatherIcon: Icon(
                FontAwesomeIcons.sun,
                size: 75.0,
                color:Colors.yellow
            ),
            );

      }
    }
  }


}