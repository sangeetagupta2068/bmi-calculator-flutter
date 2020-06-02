import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/dark_themed_card_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bottom_button_widget.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResultValue,
      @required this.bmiResultDescription,
      @required this.bmiResultType});
  final String bmiResultValue;
  final String bmiResultDescription;
  final String bmiResultType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Results',
              style: kLargeTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: DarkThemeCard(
              color: kActiveCardBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      bmiResultType,
                      style: kWeightTypeTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      bmiResultValue,
                      style: kBMITextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(bmiResultDescription,
                        style: kBMIDescriptionTextStyle,
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
