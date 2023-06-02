import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather_app/Functions/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Pages/home.dart';
//32a97c62de786499b82860e8c4ded243 - Geoloc

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  Weather obj1 = Weather(city: city1);

  Future<void> SetUp() async {
    await obj1.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'weather': obj1.weather,
      'temperature_max': obj1.temperature_max,
      'temperature_min': obj1.temperature_min,
      'temperature': obj1.temperature,
      'temperature_f': obj1.temperature_f,
      'humidity': obj1.humidity,
      'desc': obj1.desc,
      'url': obj1.icon_url,
    });
  }

    @override
  void initState()  {
    super.initState();
    String city1='Bangalore';
    SetUp();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SpinKitRotatingCircle(
          color: Colors.amber,
          size: 50.0,
        ),
        ],
      ),
    );
  }
}

