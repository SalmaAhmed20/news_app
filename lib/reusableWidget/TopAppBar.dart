import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/homeScreen/Home-Catagorized.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';
import 'Marquee.dart';

class TopBar extends StatefulWidget {
  bool isSearchPage;
  String title;
  TopBar(this.isSearchPage, this.title);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  Icon customIcon = Icon(Icons.search);
  Widget customwidget;
  bool searchbar=false;
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void initState() {
    customwidget = !widget.isSearchPage
        ? Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Center(
                child: MarqueeWidget(
              child: Text(widget.title,
                  style: GoogleFonts.exo(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
            )),
          )
        : Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Center(
              child: Text(widget.title,
                  style: GoogleFonts.exo(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          );
  }

  Widget build(BuildContext context) {
    return AppBar(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100)),
      ),
      //leading: !searchbar?SideMenu():Icon(null),
      actions: [
        if (widget.isSearchPage)
          customIcon.icon != null
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (customIcon.icon == Icons.search) {
                        customIcon = Icon(null);
                        customwidget = SafeArea(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color(0xFF39A552), width: 1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                children: [
                                  //cancel icon to back into vasic app bar
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        searchbar=true;
                                        customIcon = Icon(Icons.search);
                                        customwidget = Container(
                                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                          child: Center(
                                            child: Text(widget.title,
                                                style: GoogleFonts.exo(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                        );
                                      });
                                    },
                                    icon: Image.asset(
                                      "assets/icons/3.0x/cancel-icon@3x.png",
                                      height: 18,
                                      width: 18,
                                    ),
                                    color: Color(0xFF39A552),
                                    iconSize: 10,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: myController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Search Article',
                                          hintStyle: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFC8E6CF))),
                                    ),
                                  ),
                                 /* IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context,
                                        //  MaterialPageRoute(builder: (context) => HomeCatogrized(widget.title,KeyWord:myController.text)));
                                    },
                                    icon: Icon(Icons.search),
                                    color: Color(0xFF39A552),
                                    iconSize: 35,
                                  ),*/
                                ],
                              )),
                        );
                      }
                    });
                  },
                  icon: Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: customIcon),
                  iconSize: 40,
                )
              : Container()
      ],
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: customwidget,
      ),
      elevation: 0,
    );
  }
}

