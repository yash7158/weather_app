import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intership_weather_app/controller/get_weather.dart';
import 'package:intership_weather_app/model/weather_model.dart';
import 'package:intership_weather_app/view/mainPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CountryCodes.init();
  // Important to initialize
  weatherData w1n = await getCurrentWeather("London");
  runApp(MyApp(w1n));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp(this.w1n);
  late weatherData w1n;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: mainPage(w1n),
    );
  }
}

