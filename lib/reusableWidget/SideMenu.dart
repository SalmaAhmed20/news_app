import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SideMenu extends StatelessWidget {
  Function onSideMenuItemClick;
  SideMenu(this.onSideMenuItemClick);
  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> sideMenuList = [
      SideMenuItem(
          SideMenuItem.CATEGORIES, AppLocalizations.of(context).title10, Icons.view_list_rounded),
      SideMenuItem(SideMenuItem.SETTINGS, AppLocalizations.of(context).title11, Icons.settings),
    ];
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Text(
                '${AppLocalizations.of(context).title9}! ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                  return SideMenuWidget(sideMenuList[index],onSideMenuItemClick);
              },
              itemCount: sideMenuList.length,
            ),
          )
        ],
      ),
    );
  }
}

class SideMenuItem {
  static const CATEGORIES = 'Categories';
  static const SETTINGS = 'settings';
  String id;
  String title;
  IconData iconData;

  SideMenuItem(this.id, this.title, this.iconData);
}

class SideMenuWidget extends StatelessWidget {
  final SideMenuItem sideMenuItem;
  Function onSideMenuItemClick;
  SideMenuWidget(this.sideMenuItem,this.onSideMenuItemClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(sideMenuItem.routeName);
        onSideMenuItemClick(sideMenuItem);
      },
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 10, left: 10),
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: -3),
        leading: Icon(
          sideMenuItem.iconData,
          size: 35,
          color: Colors.black,
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              child: new Text(
                sideMenuItem.title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              alignment: Alignment(-1.2, 0),
            ),
          ],
        ),
      ),
    );
  }
}