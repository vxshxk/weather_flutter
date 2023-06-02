import 'package:weather_app/Pages/home.dart';
import 'package:weather_app/Pages/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Homepage(),
    },
  ));
}

