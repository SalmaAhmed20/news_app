import 'package:News/MyThemes.dart';
import 'package:flutter/material.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  
  const MyAppbar({
     Key key, this.title}) : super(key: key);
     
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyThemes.primaryColor,
      ),
    home: AppBar(
      shape: ContinuousRectangleBorder(borderRadius:BorderRadius.only(
        bottomLeft: Radius.circular(80),
        bottomRight: Radius.circular(80)
      )
      ),
        centerTitle: true,
        title:Text(title,style: TextStyle(
          fontFamily: "Exo",
        ),) ,
        elevation: 0,
        leading: const IconButton(
            icon: Icon(Icons.dehaze,color: Colors.white,size: 25, ),
             onPressed: null,
          ),
      ),
    );
  }


}