import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/WeatherData.dart';
import 'package:flutter_application_1/navigation/BottomNavigation.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String response = '';
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            ElevatedButton(onPressed: getData, child: Text("Get Data")),
            Text(response)
          ],
        ));
  }

  void getData() async {
    WeatherData weatherData = new WeatherData();
    response = await weatherData.getWeather(locationController.text);
    setState(() {});
  }
}
