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
    description: 'Bringing you closer to the people and things you love',
  ),
  Slide(
    imageUrl: 'assets/images/Image 7.png',
    description: 'Connect with more people, build influence, and create compelling content that\'s distinctly yours',
  ),
  Slide(
    imageUrl: 'assets/images/Image 8.png',
    description: 'Share and grow your brand with our diverse, global community',
  )
];