import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_01/screens/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  delayedNavigation() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, () => Routes.sailor(HomeRoute));
  }

  @override
  void initState() {
    super.initState();
    delayedNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Chicken and Avocado Burritos.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Foodie',
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 48),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ^--^',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 54,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/burger.png",
                      height: 48,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Deliciously Simple",
                        style: TextStyle(
                          color: Colors.transparent.withAlpha(125),
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
