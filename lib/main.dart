import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff0A0E21),
          scaffoldBackgroundColor: Color(0xff0A0D23),
          accentColor: Colors.purpleAccent,
          textTheme: TextTheme(
              body1: TextStyle(
            color: Colors.white,
          ))),
      home: InputPage(),
    );
  }
}
