import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/BottomNavigation.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key}) : super(key: key);

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Training Data"),
        ),
        bottomNavigationBar: BottomNavigation(),
        body: Center(
          child: FlutterLogo(),
        ));
  }
}
