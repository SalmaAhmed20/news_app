import 'package:flutter/material.dart';
import 'Decorate.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';
import 'NewsCategory.dart';
import 'package:news_app/reusableWidget/TopAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryMenu extends StatefulWidget {
  static const routeName = "Category Menu";

  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  Decorate decore = new Decorate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
              ),
              title: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Center(
                  child: Text(AppLocalizations.of(context).title,
                      style: TextStyle(
                        fontFamily: 'exo',
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              )),
        ),
        drawer: SideMenu(),
        body: ListView(children: [
          Column(children: [
            Container(
              width: 300,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Stack(
                      children: [
                        Text(
                          AppLocalizations.of(context).title2,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PoppinsBold",
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Row(children: [
              NewsCategory(AppLocalizations.of(context).title3, 'assets/images/sports.png',
                  Color.fromARGB(255, 201, 28, 34), decore.decorateBottomLeft),
              NewsCategory(AppLocalizations.of(context).title4, 'assets/images/Politics.png',
                  Color.fromARGB(255, 0, 62, 144), decore.decoratebottomRight),
            ]),
            Row(children: [
              NewsCategory(AppLocalizations.of(context).title5, 'assets/images/health.png',
                  Color.fromARGB(255, 237, 30, 121), decore.decorateBottomLeft),
              NewsCategory(
                  AppLocalizations.of(context).title6,
                  'assets/images/bussines.png',
                  Color.fromARGB(255, 207, 126, 72),
                  decore.decoratebottomRight),
            ]),
            Row(children: [
              NewsCategory(AppLocalizations.of(context).title7, 'assets/images/environment.png',
                  Color.fromARGB(255, 72, 130, 207), decore.decorateBottomLeft),
              NewsCategory(
                  AppLocalizations.of(context).title8,
                  'assets/images/science.png',
                  Color.fromARGB(255, 242, 211, 82),
                  decore.decoratebottomRight),
            ]),
          ]),
        ]));
  }
}
