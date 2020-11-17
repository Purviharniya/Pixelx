import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots({this.isActive});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: isActive? 15 : 10,
      width: isActive?15 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: isActive? LinearGradient(
          colors: [Colors.red, Colors.purple], stops: [0.3,0.7], begin: Alignment.topCenter,end: Alignment.bottomCenter
        ): LinearGradient(
          colors: [Colors.grey, Colors.grey], stops: [0.3,0.7],
        ),
      ),
    );
  }
}
