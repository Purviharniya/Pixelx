import 'package:pixelx/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'slide.dart';

class SlideItem extends StatelessWidget {

  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
        ),
        Container(
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(slideList[index].imageUrl),
                fit: BoxFit.fill
              )),

        ),
        Text(slideList[index].description,
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ],
    );
  }
}
