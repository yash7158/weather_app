import 'package:flutter/material.dart';

class weatherData {
  String city = "_";
  String country = "_";
  String date = "_";
  Image iconImage = Image.network("https://openweathermap.org/img/w/01d.png",scale: 0.8);
  String temp = "_";
  String weatherAbout = "_";
  List<Widget> forecast = [];
  String today = "Today";

}

class forecastData{
  String date = "_";
  Image iconImage = Image.network("https://openweathermap.org/img/w/04n.png");
  String temp ="_";
}