import 'package:flutter/material.dart';

final kPixelx = RichText(
    text: TextSpan(
        text: 'P',
        style: TextStyle(
          color: const Color(0xff5907FF),
          fontSize: 60,
          fontFamily: 'Baskerville',
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 3.0,
              color: Colors.black54,
              offset: Offset(2, 2.5),
            ),
          ],
        ),
        children: <TextSpan>[
      TextSpan(
        text: 'i',
        style: TextStyle(color: const Color(0xff3B01FF)),
      ),
      TextSpan(
        text: 'x',
        style: TextStyle(color: const Color(0xff9D01F6)),
      ),
      TextSpan(
        text: 'e',
        style: TextStyle(color: const Color(0xffE606FF)),
      ),
      TextSpan(
        text: 'l',
        style: TextStyle(color: const Color(0xffFF06D6)),
      ),
      TextSpan(
        text: 'X',
        style: TextStyle(color: const Color(0xffFF066C)),
      ),
    ]));


final kInputHintTextStyle= TextStyle(
  decoration: TextDecoration.none,
  fontFamily: 'Baskerville',
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);

final kInputTextDecoration=InputDecoration(
  labelStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(),
);

final kButtonTextStyle1 = TextStyle(
color: Colors.white,
fontFamily: 'Baskerville',
fontSize: 24,
fontWeight: FontWeight.bold,
);

final hrLine = Expanded(
  child: new Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Divider(
        color: Color(0xff707070),
        height: 36,
        thickness: 1,
      )),
);

final kSignUpTextStyle = TextStyle(
  fontFamily: 'Baskerville',
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);