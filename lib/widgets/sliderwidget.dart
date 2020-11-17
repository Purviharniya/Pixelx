import 'package:pixelx/widgets/slide.dart';
import 'package:flutter/material.dart';

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
          width:(MediaQuery.of(context).size.width- 30),
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(slideList[index].imageUrl),
                fit: BoxFit.fill
              )),

        ),
        Text(slideList[index].description,          
        textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
          ),
        ),
      ],
    );
  }
}
