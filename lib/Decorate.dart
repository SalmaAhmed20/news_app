import 'package:flutter/cupertino.dart';

class Decorate {

  Widget decorateBottomLeft(Color color,String imagePath)
  {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular( 16.0),
            bottomLeft: Radius.circular(16.0),
          )
      ),
      child: Image.asset(imagePath),
    );
  }
  Widget decoratebottomRight(Color color,String imagePath)
  {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular( 16.0),
            bottomRight: Radius.circular(16.0),
          )
      ),
      child: Image.asset(imagePath),
    );
  }
}