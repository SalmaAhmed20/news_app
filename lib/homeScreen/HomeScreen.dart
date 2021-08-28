//import 'package:drawer/categoryScreen/CategoryMenu.dart';
//import 'package:drawer/homeScreen/Home-Catagorized.dart';
//import 'package:drawer/reusableWidget/SideMenu.dart';
import 'package:news_app/categoryScreen/CategoryMenu.dart';
import 'package:news_app/categoryScreen/NewsCategory.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Home-Catagorized.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsCategory selectedCategory=null;
  bool inSetting= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(this.onSideMenuItemClick),
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: Color.fromARGB(255, 57, 165, 82),
      ),
      body: (selectedCategory==null&& !inSetting)?CategoryMenu():
      (selectedCategory!=null&& !inSetting)?HomeCatogrized(CategoryScreenArguments("sport","hh")):null


    );

  }


  /*void onCategoryItemClick(Category category){
    setState(() {
      selectedCategory = category;
      KeyWord = category.KeyWord;
    });
  }*/
  void onSideMenuItemClick(SideMenuItem sideMenuItem){
    if(sideMenuItem.id == SideMenuItem.CATEGORIES){
      setState(() {
        selectedCategory=null;
        inSetting=false;

      });
    }else if (sideMenuItem.id == SideMenuItem.SETTINGS){
      // to handle
      setState(() {
        inSetting=true;
        selectedCategory=null;

      });
    }
    Navigator.pop(context);
  }
}