//import 'package:drawer/categoryScreen/CategoryMenu.dart';
//import 'package:drawer/homeScreen/Home-Catagorized.dart';
//import 'package:drawer/reusableWidget/SideMenu.dart';
import 'package:news_app/api/APIManger.dart';
import 'package:news_app/api/AppConfigProvider.dart';
import 'package:news_app/categoryScreen/CategoryGridItem.dart';
import 'package:news_app/categoryScreen/CategoryMenu.dart';
import 'package:news_app/categoryScreen/NewsCategory.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/reusableWidget/TopAppBar.dart';
import 'package:provider/provider.dart';
import 'Home-Catagorized.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
   CategoryScreenArguments categoryScreen;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryGridItem selectedCategory=null;
  bool inSetting= false;
   String title="news";

  bool isSearchPage = true;
  Widget customwidget;
  Future<SourcesResponse> newsFuture;
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    //newsFuture = getNewsSources(widget.categoryScreen.category);
    //AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
        drawer: SideMenu(this.onSideMenuItemClick),
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
       child: AppBar(
          /*leading: provider.getFolded()
              ? Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          )*/

            //  : Container(),
          toolbarHeight: 70,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "News",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Exo',
            ),
          ),
          centerTitle: true,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),
          actions: [
            (!inSetting&&selectedCategory!=null)?TopBar(isSearchPage,selectedCategory.title):Container(),
          ],
        ),
        ),
        // title: Text("News"),
        //backgroundColor: Color.fromARGB(255, 57, 165, 82),
        // ),
        body: (selectedCategory==null&& !inSetting)?NewsCategory(this.onCategoryItemClick):
        (selectedCategory!=null&& !inSetting)?HomeCatogrized(CategoryScreenArguments(
            selectedCategory.category,
            selectedCategory.title)):inSetting?Setting():null,

    );

  }


  void onCategoryItemClick(CategoryGridItem category){
    setState(() {
      selectedCategory = category;
      title = category.title;
    });
  }
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

class Setting {
}