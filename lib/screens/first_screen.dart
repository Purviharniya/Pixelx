import 'package:flutter/material.dart';
import 'package:pixelx/widgets/slide.dart';
import 'package:pixelx/screens/login_screen.dart';
import 'package:pixelx/screens/signup_screen.dart';
import 'package:pixelx/widgets/slidedots.dart';
import 'package:flutter/cupertino.dart';
import 'package:pixelx/widgets/sliderwidget.dart';
import 'package:pixelx/constants.dart';

class FirstScreen extends StatefulWidget {
  static final String id = 'first_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: kPixelx,
            ),
            Expanded(
              child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    PageView.builder(
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                      onPageChanged: _onPageChanged,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(isActive: true)
                                else
                                  SlideDots(isActive: false)
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20,
                          right: MediaQuery.of(context).size.width / 20,
                          top: 14,
                          bottom: 14,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.elasticInOut);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return SignupScreen();
                              },
                            ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.black,
                      splashColor: Colors.black,
                      elevation: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      highlightElevation: 10,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20,
                          right: MediaQuery.of(context).size.width / 20,
                          top: 14,
                          bottom: 14,
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.elasticInOut);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return LoginScreen();
                              },
                            ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.black,
                      splashColor: Colors.black,
                      elevation: 10,
                      colorBrightness: Brightness.dark,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
