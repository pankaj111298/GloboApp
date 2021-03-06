import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/BMIScreen.dart';
import 'package:flutter_application_1/screens/IntroScreen.dart';
import 'package:flutter_application_1/screens/TrainingScreen.dart';
import 'package:flutter_application_1/screens/WeatherScreen.dart';

void main() {
  runApp(GloboApp());
}

class GloboApp extends StatelessWidget {
  const GloboApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      routes: {
        '/': (context) => IntroScreen(),
        '/BMI': (context) => BMIScreen(),
        '/Weather': (context) => WeatherScreen(),
        '/Training': (context) => TrainingScreen()
      },
      initialRoute: '/',
      // home: IntroScreen(),
    );
  }
}
