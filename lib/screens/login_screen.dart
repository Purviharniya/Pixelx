import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:pixelx/screens/signup_screen.dart';
import 'package:pixelx/services/auth_service.dart';
import 'package:pixelx/constants.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Logging in the user w/ Firebase
      AuthService.login(context, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              kPixelx,
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      padding: new EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 10),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              validator: (input) => !input.contains('@')
                                  ? 'Please enter a valid email'
                                  : null,
                              onSaved: (input) => _email = input,
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
                                style: kInputHintTextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      padding: new EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 10),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              validator: (input) => input.length < 6
                                  ? 'Must be at least 6 characters'
                                  : null,
                              onSaved: (input) => _password = input,
                              obscureText: true,
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
                                'Password',
                                style: kInputHintTextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
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
                            'Log In',
                            style: kButtonTextStyle1,
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 225,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff707070))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: "Don't have an Account ? ",
                                style: kInputHintTextStyle,
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, SignupScreen.id);
                                  },
                                text: 'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Baskerville',
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff2874CB),
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
