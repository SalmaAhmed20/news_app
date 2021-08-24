
import 'dart:async';

import 'package:flutter/material.dart';

import 'CategoryMenu.dart';

class SplashScreen extends StatefulWidget {
  static const routeName="SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
         ()=>Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CategoryMenu())),);
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(
          image: AssetImage("assets/images/bg_image.png"),
          fit: BoxFit.fill,
        )
      ),
      child: Scaffold(
         backgroundColor: Colors.transparent,
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children:[
             Row(
               children: [
                 Expanded(child:Padding(padding:EdgeInsets.only(top:70) ),)
               ],
             ),
             Row(
               
               mainAxisAlignment: MainAxisAlignment.center,
               mainAxisSize: MainAxisSize.max,
               crossAxisAlignment: CrossAxisAlignment.center,
               
               children: [
                 Expanded(
                  child:
                  Image(
                        image: AssetImage('assets/images/logo.png'), 
               ),
                 ),
               ],
               ),
            
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               
               children:[
                 Image(
                   image:AssetImage('assets/images/route.png') ,)
               ]
             )
           ]
         )
        ),
    );
  }
}