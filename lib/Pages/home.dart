import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather_app/Functions/weather.dart';
import 'package:weather_app/Pages/loading.dart';


String city1='Bangalore';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Map data2 = {};

  @override
  Widget build(BuildContext context) {

    //data2 = data2.isNotEmpty ? data2 : ModalRoute.of(context)?.settings?.arguments as Map<dynamic,dynamic>;
    data2= ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: TextField(
                      onSubmitted: (text) async{
                        city1=text;
                        await Navigator.pushReplacementNamed(context, '/');
                      },
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
                        hintText: 'Enter Location',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    color: Colors.amber,
                    iconSize: 30.0,
                    onPressed: () async{
                      Response response1 = await get(Uri.parse('https://api.ipify.org?format=json'));
                      Map data4= await jsonDecode(response1.body);
                      Response response5 = await get(Uri.parse('http://ip-api.com/json/${data4['ip']}'));
                      Map data5= await jsonDecode(response5.body);
                      city1=data5['city'];
                      await Navigator.pushReplacementNamed(context, '/');
                    },
                    icon: Icon(Icons.my_location),
                  ),
                ),
                SizedBox(
                  width: 25.0,
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Icon(
                     Icons.location_pin,
                     color: Colors.amber,
                   ),
                   SizedBox(
                     width: 2.0,
                   ),
                   Text(
                     '$city1',
                     style: TextStyle(
                       color: Colors.amber,
                       fontSize: 20.0,
                     ),
                   )
                  ],
                )
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        data2['temperature'],
                         style: TextStyle(
                           color: Colors.amber,
                           fontSize: 90.0,
                         ),
                      ),
                      Text(
                        ' °C',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
            Expanded(
              flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        data2['weather'],
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.network(data2['url'])
                  ],
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Text(
                    data2['desc'],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.amber,
                    ),
                  ),
                )
            ),
            Expanded(
              flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Expanded(
                             flex:1,
                             child: Text(
                               'Max',
                               style: TextStyle(
                                 color: Colors.amber,
                                 fontSize: 25.0,
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 2.0,
                           ),
                           Expanded(
                             flex:3,
                             child: Text(
                               data2['temperature_max'],
                               style: TextStyle(
                                 color: Colors.amber,
                                 fontSize: 60.0,
                               ),
                             ),
                           )
                         ],
                       ),
                    ),
                    SizedBox(
                      width: 45.0,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex:1,
                            child: Text(
                              'Min',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Expanded(
                            flex:3,
                            child: Text(
                              data2['temperature_min'],
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 60.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex:1,
                            child: Text(
                              'Feels like',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Expanded(
                            flex:3,
                            child: Text(
                              data2['temperature_f'],
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 60.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 65.0,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex:1,
                            child: Text(
                              'Humidity',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Expanded(
                            flex:3,
                            child: Text(
                              data2['humidity'],
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 60.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}



