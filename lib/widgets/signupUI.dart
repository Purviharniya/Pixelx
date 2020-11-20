import 'package:flutter/material.dart';
import 'package:pixelx/constants.dart';

class SignupUI extends StatefulWidget {
  @override
  _SignupUIState createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding:
                new EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: kInputTextDecoration,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    color: Colors.white,
                    child: Text(
                      'Username',
                      style: kInputHintTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding:
                new EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: kInputTextDecoration,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    color: Colors.white,
                    child: Text(
                      'Email',
                      style:kInputHintTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding:
                new EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration:kInputTextDecoration,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    color: Colors.white,
                    child: Text(
                      'Phone Number',
                      style: kInputHintTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding:
                new EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration:kInputTextDecoration,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    color: Colors.white,
                    child: Text(
                      'Password',
                      style:kInputHintTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.black,
                child: Text(
                  'Sign Up',
                  style: kButtonTextStyle1,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ]));
  }
}
