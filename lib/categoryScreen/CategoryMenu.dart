import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Decorate.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';
import 'NewsCategory.dart';


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
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Center(
                child: Text("NewsApp",
                    style: GoogleFonts.exo(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
          ),
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
                          "Pick your category of interest",
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
              NewsCategory("Sports", 'assets/images/sports.png',
                  Color.fromARGB(255, 201, 28, 34), decore.decorateBottomLeft),
              NewsCategory("Politics", 'assets/images/Politics.png',
                  Color.fromARGB(255, 0, 62, 144), decore.decoratebottomRight),
            ]),
            Row(children: [
              NewsCategory("Health", 'assets/images/health.png',
                  Color.fromARGB(255, 237, 30, 121), decore.decorateBottomLeft),
              NewsCategory(
                  "Business",
                  'assets/images/bussines.png',
                  Color.fromARGB(255, 207, 126, 72),
                  decore.decoratebottomRight),
            ]),
            Row(children: [
              NewsCategory("Enviroment", 'assets/images/environment.png',
                  Color.fromARGB(255, 72, 130, 207), decore.decorateBottomLeft),
              NewsCategory(
                  "Science",
                  'assets/images/science.png',
                  Color.fromARGB(255, 242, 211, 82),
                  decore.decoratebottomRight),
            ]),
          ]),
        ]));
  }
}
