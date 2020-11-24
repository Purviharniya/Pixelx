import 'package:flutter/material.dart';
import 'package:pixelx/services/auth_service.dart';
import 'package:pixelx/constants.dart';
import 'package:email_validator/email_validator.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _name, _email, _password, _contact;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _name, _email, _password, _contact);
    }
  }

  String validateMobile(String input) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(pattern);
    if (input.length == 0) {
      return "Number is required";
    } else if (!regExp.hasMatch(input)) {
      return "Number must be a 0-9 & of 10 digits only";
    } else {
      return null;
    }
  }

  String validatePassword(String input) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(input);
    if (input.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(input))
        return 'Password should contain atleast 1 special, 1 uppercase and \n 1 digit. It should have atleast 8 characters. ';
      else
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              kPixelx,
              SizedBox(height: 20.0),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please enter a valid name'
                                  : null,
                              onSaved: (input) => _name = input,
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
                      padding: new EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 10),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              validator: (input) =>
                                  EmailValidator.validate(input)
                                      ? null
                                      : "Invalid Email Address",
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
                              keyboardType: TextInputType.number,
                              validator: validateMobile,
                              onSaved: (input) => _contact = input,
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
                      padding: new EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 10),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              validator: validatePassword,
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
                            'Sign Up',
                            style: kButtonTextStyle1,
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50.0, right: 50, top: 20),
                      child: Text(
                        'By signing up, you agree to our Terms, Data Policy, and Cookies Policy',
                        textAlign: TextAlign.center,
                        style: kSignUpTextStyle,
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
