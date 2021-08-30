import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/homeScreen/HomeScreen.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen())),
    );
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/3.0x/pattern@3x.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 120.0),
                      child: SizedBox(
                        height: 200,
                        child: Image(
                          image: AssetImage('assets/images/3.0x/logo@3x.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    alignment: Alignment(0.0, -1.0),
                    child: SizedBox(
                      height: 120,
                      child: Image(
                        image: AssetImage('assets/images/3.0x/route@3x.png'),
                      ),
                    ),
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    ]);
  }
}
