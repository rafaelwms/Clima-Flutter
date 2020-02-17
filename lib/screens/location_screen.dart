import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final locationWeather;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int weatherId;
  int temperature;
  String cityName;

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic wheatherData){
    weatherId = wheatherData['weather'][0]['id'];
    double temp = wheatherData['main']['temp'];
    temperature = temp.toInt();
    cityName = wheatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
var weatherId = jsonDecode(data)['weather'][0]['id'];
var temperature = jsonDecode(data)['main']['temp'];
var cityName = jsonDecode(data)['name'];
print(response.body);
print('Weader ID: $weatherId');
print('Temperature: $temperature');
print('City name: $cityName');
*/