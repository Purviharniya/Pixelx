import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelx/constants.dart';
import 'package:pixelx/pages/profile.dart';
import 'package:pixelx/pages/search.dart';
import 'package:pixelx/pages/upload.dart';
import 'package:pixelx/widgets/loginUI.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'timeline.dart';
import 'activityfeed.dart';
import '';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;

  void enable(bool value) {
    setState(() => isAuth = value);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    // Reauthenticate user when app is opened
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

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(
      pageIndex,
    );
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                kPixelx,
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    LoginUI(),
                    SizedBox(
                      height: 22,
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
                      height: 30,
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
                  ],
                ),
                SizedBox(
                  height: 185,
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
                                print('navigate to signup');
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
        ),
      ),
    );
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Timeline(),
          Search(),
          Upload(),
          ActivityFeed(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
          inactiveColor: Color(0xff363232).withOpacity(0.7),
          currentIndex: pageIndex,
          onTap: onTap,
          activeColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                size: 35.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.headset),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
          ]),
    );
    // return RaisedButton(
    //   child: Text('Logout'),
    //   onPressed: logout,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
