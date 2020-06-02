import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/dark_themed_card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/icon_content_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/round_icon_button_widget.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/widgets/bottom_button_widget.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DarkThemeCard(
                    onPressed: () {
                      this.setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    color: (selectedGender == Gender.MALE)
                        ? kActiveCardBackgroundColor
                        : kInactiveCardBackgroundColor,
                    child: IconContent(
                        iconData: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: DarkThemeCard(
                    onPressed: () {
                      this.setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    color: (selectedGender == Gender.FEMALE)
                        ? kActiveCardBackgroundColor
                        : kInactiveCardBackgroundColor,
                    child: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DarkThemeCard(
              color: kInactiveCardBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(this.height.toString(), style: kLargeTextStyle),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kActiveSliderColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      overlayColor: kOverlayColor,
                      inactiveTrackColor: kInactiveSliderColor,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 124,
                      max: 220,
                      onChanged: (value) {
                        this.setState(() {
                          this.height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DarkThemeCard(
                    color: kInactiveCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          this.weight.toString(),
                          style: kLargeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  this.setState(() {
                                    this.weight = this.weight + 1;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                this.setState(() {
                                  this.weight = this.weight - 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DarkThemeCard(
                    color: kInactiveCardBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          this.age.toString(),
                          style: kLargeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  this.setState(() {
                                    this.age = this.age + 1;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                this.setState(() {
                                  this.age = this.age - 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              text: 'CALCULATE',
              onPressed: () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain(height: this.height, weight: this.weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResultValue: calculatorBrain.getBMIValue(),
                        bmiResultType: calculatorBrain.getBMIType(),
                        bmiResultDescription:
                            calculatorBrain.getBMIDescription(),
                      ),
                    ));
              })
        ],
      ),
    );
  }
}
