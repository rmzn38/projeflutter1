import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hava_durumu.dart';

class havaPage extends StatefulWidget {
  final WeatherData weatherData;

  havaPage({@required this.weatherData});

  @override
  _hava_durumuState createState() => _hava_durumuState();
}

class _hava_durumuState extends State<havaPage> {
  int temperature;
  Icon weatherDisplayIcon;
  String city;
  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      city = weatherData.city;
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '$temperature°',
                style: TextStyle(
                    color: Colors.blue, fontSize: 80.0, letterSpacing: -5),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                city,
                style: TextStyle(
                    color: Colors.blue, fontSize: 50.0, letterSpacing: -5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
