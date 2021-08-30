
import 'package:news_app/categoryScreen/CategoryGridItem.dart';
import 'package:news_app/categoryScreen/NewsCategory.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';
import 'package:flutter/material.dart';
import 'package:news_app/reusableWidget/TopAppBar.dart';
import 'package:news_app/reusableWidget/setting.dart';
import 'Home-Catagorized.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryGridItem selectedCategory = null;
  bool inSetting = false;
  String title ;
  bool isSearchPage = true;
  @override
  Widget build(BuildContext context) {
    title= AppLocalizations.of(context).title9;
    return Scaffold(
      drawer: SideMenu(this.onSideMenuItemClick),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
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
            (!inSetting && selectedCategory != null)
                ? TopBar(isSearchPage, selectedCategory.title)
                : Container(),
          ],
        ),
      ),
      body: (selectedCategory == null && !inSetting)
          ? NewsCategory(this.onCategoryItemClick)
          : (selectedCategory != null && !inSetting)
          ? HomeCatogrized(CategoryScreenArguments(
          selectedCategory.category.toLowerCase(), selectedCategory.title.toLowerCase()))
          : inSetting
          ? Setting()
          : null,
    );
  }

  void onCategoryItemClick(CategoryGridItem category) {
    setState(() {
      selectedCategory = category;
      title = category.title;
    });
  }

  void onSideMenuItemClick(SideMenuItem sideMenuItem) {
    if (sideMenuItem.id == SideMenuItem.CATEGORIES) {
      setState(() {
        selectedCategory = null;
        inSetting = false;
        title =  AppLocalizations.of(context).title9;
      });
    } else if (sideMenuItem.id == SideMenuItem.SETTINGS) {
      // to handle
      setState(() {
        inSetting = true;
        selectedCategory = null;
        title="settings";
      });
    }
    Navigator.pop(context);
  }
}


