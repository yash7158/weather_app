import 'dart:convert';

import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:intership_weather_app/controller/date.dart';
import 'package:intership_weather_app/controller/iconImage.dart';
import 'package:intership_weather_app/controller/weather.dart';
import 'package:intership_weather_app/model/weather_model.dart';
import 'package:intership_weather_app/widget/forecast.dart';

const apiKey = "Your api key";
Future<weatherData> getCurrentWeather(String city) async {
  //get data from api
  try {
    final resCur = jsonDecode(await fetchWeatherCurrent(apiKey, city));
    final resFor = jsonDecode(await fetchWeatherForecast(apiKey, city));

    //check weather request is ok
    if(resCur["cod"].toString()=="200" && resFor["cod"].toString()=="200"){
      //update the data
      weatherData w1 = weatherData();
      w1.city = resCur["name"];
      w1.country  = countryCodeToName(resCur["sys"]["country"]) ?? resCur["sys"]["country"];
      w1.date = convertTimestampToString(resCur["dt"]);
      w1.iconImage = Image(image: NetworkImage(getIconUrl(resCur["weather"][0]["icon"].toString())));
      w1.temp = resCur["main"]["temp"].toString();
      w1.weatherAbout = resCur["weather"][0]["main"];

      //extract forecast data
      List f1 = extractForecast(jsonEncode(resFor));
      for(var i in f1){
        //create the forecast widget
        w1.forecast.add(forecast(formatDate(i['dt']), Image.network(getIconUrl(i['icon'])), i['temp'].toString()));
      }
      return w1;
    }else{
      return weatherData();
    }
  }catch(e){
    print(e);
    weatherData w1 = weatherData();
    w1.today  = "Failed to load weather forecast";
    return w1;
  }
}


// function used to create list of element with forecast for each day
List<Map<String, dynamic>> extractForecast(String jsonResponse) {
  var response = json.decode(jsonResponse);
  var list = response['list'] as List;

  // Creating a map to hold daily data
  Map<String, Map<String, dynamic>> dailyData = {};

  for (var element in list) {
    var dateTime = DateTime.parse(element['dt_txt']);
    var date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    //check weather date exist in list
    if (!dailyData.containsKey(date)) {
      dailyData[date] = {
        'dt': element['dt'],
        'temp': element['main']['temp'],
        'icon': element['weather'][0]['icon']
      };
    }
  }

  return dailyData.values.toList().skip(1).take(6).toList();
}

String? countryCodeToName(String countryCode) {
  final countryDetails = CountryCodes.detailsForLocale(Locale('und', countryCode));
  return countryDetails.localizedName;
}