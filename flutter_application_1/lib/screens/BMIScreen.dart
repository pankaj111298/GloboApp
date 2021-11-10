import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/BottomNavigation.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMetric = true;
  bool isImperial = false;
  final double fontSize = 18;
  late List<bool> selectedToggle;
  String? result;
  @override
  void initState() {
    selectedToggle = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        children: [
          ToggleButtons(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Metric",
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Imperial",
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
            ],
            isSelected: selectedToggle,
            onPressed: pressed,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Calculate BMI"))
        ],
      ),
    );
  }

  void pressed(int index) {
    if (index == 1) {
      isMetric = false;
      isImperial = true;
    } else {
      isMetric = true;
      isImperial = false;
    }
    setState(() {
      selectedToggle = [isMetric, isImperial];
    });
  }
}
