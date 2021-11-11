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
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String result = '';
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
            child: TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter the weight",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter the height",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          ElevatedButton(
              onPressed: calculateBMI,
              child:
                  Text("Calculate BMI", style: TextStyle(fontSize: fontSize))),
          Text(result, style: TextStyle(fontSize: fontSize))
        ],
      ),
    );
  }

  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double bmi;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = "BMI is" + bmi.toStringAsFixed(2);
    });
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
