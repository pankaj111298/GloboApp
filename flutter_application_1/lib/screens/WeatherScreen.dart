import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/WeatherData.dart';
import 'package:flutter_application_1/navigation/BottomNavigation.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherData response = new WeatherData();
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
        ),
        bottomNavigationBar: BottomNavigation(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                    hintText: "Enter the city",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: getData,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            weatherRow("City :", response.name),
            weatherRow("Description :", response.description),
            weatherRow(
                "Temperature :", response.temperature.toStringAsFixed(2)),
            weatherRow("Humidity :", response.humidity.toStringAsFixed(2)),
            weatherRow("Pressure :", response.pressure.toStringAsFixed(2)),
          ],
        ));
  }

  void getData() async {
    WeatherData weatherData = new WeatherData();
    response = await weatherData.getWeather(locationController.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label, style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            flex: 4,
            child: Text(value, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
    return row;
  }
}
