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
              color: Colors.black,
              offset: Offset(2.5, 2.5),
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
        text: 'x',
        style: TextStyle(color: const Color(0xffFF066C)),
      ),
    ]));

