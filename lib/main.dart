import 'package:flutter/material.dart';
import 'package:news_app/homeScreen/Home-Catagorized.dart';

import 'splashScreen/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        primaryColor: Color(0xFF39A552)
      ),
      routes: {
        SplashScreen.routeName:(buildContext)=>SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,

    );
  }
}
