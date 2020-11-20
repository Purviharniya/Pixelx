import 'package:flutter/material.dart';
import 'package:pixelx/constants.dart';
import 'package:pixelx/widgets/signupUI.dart';
import 'package:google_sign_in/google_sign_in.dart';
final GoogleSignIn googleSignIn = GoogleSignIn();

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override

  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    // Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    // Re authenticate user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('Error signing in: $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      print('User signed in!: $account');
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                kPixelx,
                SizedBox(
                  height: 30,
                ),
                SignupUI(),
                SizedBox(
                  height: 18,
                ),
                Row(children: <Widget>[
                  HrLine,
                  Text(
                    "OR",
                    style: kInputHintTextStyle,
                  ),
                  HrLine,
                ]),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: login,
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 60),
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/google_signin_button.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
        ),
      ),
    );
  }
}
