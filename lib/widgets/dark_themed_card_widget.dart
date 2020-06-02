import 'package:flutter/material.dart';

class DarkThemeCard extends StatelessWidget {
  DarkThemeCard({
    @required this.color,
    @required this.onPressed,
    this.child,
  });

  final Color color;
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: this.child,
      ),
    );
  }
}
