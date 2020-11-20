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
          height: 50,
        ),
        Container(
          width:(MediaQuery.of(context).size.width),
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(slideList[index].imageUrl),
                fit: BoxFit.fill
              )),

        ),
        Padding(
          padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
          child: Text(
            slideList[index].description,
          textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 20,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
