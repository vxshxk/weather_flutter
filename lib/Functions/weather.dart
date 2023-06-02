import 'package:http/http.dart';
import 'dart:convert';
//Wkey=   7a87c226dec899a283cc738a9a3a2553
class Weather{

  String? city;
  String? lat;
  String? lon;
  String? temperature_max;
  String? temperature_min;
  String? temperature;
  String? temperature_f;
  String? humidity='';
  String? weather;
  String? desc;
  String? icon_url;
  Weather({ required this.city });

  Future<void> getData() async{
    String ur='https://api.openweathermap.org/data/2.5/weather?q=$city&appid=7a87c226dec899a283cc738a9a3a2553';
    Uri url = Uri.parse(ur);
    Response response = await get(url);
    Map data= jsonDecode(response.body);

    List<dynamic> w= data['weather'];
    Map w1 = w[0];
    weather=w1['main'];
    desc=w1['description'];
    print(data);
    Map t= data['main'];
    temperature_max=(t['temp_max']-273.0).toStringAsFixed(2);
    temperature_min=(t['temp_min']-273.0).toStringAsFixed(2);
    temperature=(t['temp']-273.0).toStringAsFixed(2);
    temperature_f=(t['feels_like']-273.0).toStringAsFixed(2);
    humidity=t['humidity'].toString();
    icon_url = 'https://openweathermap.org/img/wn/${w1['icon']}@2x.png';
  }
}