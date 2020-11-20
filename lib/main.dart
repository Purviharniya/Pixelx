import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelx/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(
          alignment: AlignmentDirectional.center,
          color: Colors.white,
          child: Home()),
    );
  }
}
