import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slide
{
  final String imageUrl;
  final String description;

  Slide({@required this.imageUrl, @required this.description});

}

final slideList=[
  Slide(
    imageUrl: 'assets/images/Image 6.png',
    description: 'description 1',
  ),
  Slide(
    imageUrl: 'assets/images/Image 7.png',
    description: 'description 2',
  ),
  Slide(
    imageUrl: 'assets/images/Image 8.png',
    description: 'description 3',
  )
];