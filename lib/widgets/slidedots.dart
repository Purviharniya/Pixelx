import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SlideDots extends StatefulWidget {
  bool isActive;
  SlideDots({this.isActive});

  @override
  _SlideDotsState createState() => _SlideDotsState();
}

class _SlideDotsState extends State<SlideDots> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: widget.isActive? 20 : 15,
      width: widget.isActive?20 : 15,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff707070),
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: widget.isActive? LinearGradient(
          colors: [Color(0xffFF0303),Color(0xff680EF2) ,Color(0xff37077F)], stops: [0.3,0.5,0.7], begin: Alignment.topCenter,end: Alignment.bottomCenter
        ): LinearGradient(
          colors: [Color(0xff3D335A), Color(0xff3D335A)], stops: [0.3,0.7],
        ),
      ),
    );
  }
}
