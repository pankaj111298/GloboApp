import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/BottomNavigation.dart';
import 'package:flutter_application_1/navigation/MenuDrawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness App"),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(18),
              child: Text("Fitness is all you need for better life",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18))),
        ),
      ),
    );
  }
}
