import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 25,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: "BMI"),
        BottomNavigationBarItem(
            icon: Icon(Icons.cloud_queue), label: "Weather"),
        BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new_sharp), label: "Training"),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/BMI');
            break;
          case 2:
            Navigator.pushNamed(context, '/Weather');
            break;
          case 3:
            Navigator.pushNamed(context, '/Training');
            break;
          default:
            break;
        }
      },
    );
  }
}
