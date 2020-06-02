import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class CalculatorBrain {
  int height;
  int weight;
  double _bmiValue;

  CalculatorBrain({@required this.height, this.weight});
  String getBMIValue() {
    _bmiValue = (weight / (height * height * 1 / 100 * 1 / 100));
    return _bmiValue.toStringAsFixed(1);
  }

  String getBMIType() {
    if (_bmiValue >= 25)
      return 'OVERWEIGHT';
    else if (_bmiValue > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getBMIDescription() {
    if (_bmiValue >= 25)
      return 'You have a higher than normal weight. Try to exercise more.';
    else if (_bmiValue > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
