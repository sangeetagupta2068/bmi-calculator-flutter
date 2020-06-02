import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  BottomButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        child: Center(
            child: Text(
          this.text,
          style: kLargeButtonStyle,
        )),
        color: Color(0xffEB1555),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}

//(){
//Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage()));
//}
