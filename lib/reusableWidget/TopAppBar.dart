import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/categoryScreen/CategoryGridItem.dart';
import 'package:news_app/homeScreen/Home-Catagorized.dart';

class TopBar extends StatefulWidget {
  bool isSearchPage;
  String title;
  TopBar(this.isSearchPage, this.title);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  CategoryGridItem selectedCategory;
  Icon customIcon = Icon(Icons.search);
  Widget customwidget;
  bool searchbar = false;
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void initState() {
    customwidget = Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Center(
        child: Text(widget.title,
            style: TextStyle(
              fontFamily: 'Exo',
              fontSize: 25,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
        ),
        actions: [
          if (widget.isSearchPage)
            customIcon.icon != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        if (customIcon.icon == Icons.search) {
                          searchbar = true;
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
                                    //cancel icon to back into basic app bar
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          searchbar = false;
                                          customIcon = Icon(Icons.search);
                                          customwidget = Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 20, 0, 0),
                                            child: Center(
                                              child: Text(widget.title,
                                                  style: TextStyle(
                                                    fontFamily: 'Exo',
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
                                        onSubmitted: (String va) {
                                          if (myController.text != '') {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeCatogrized(
                                                            CategoryScreenArguments(
                                                                widget.title,
                                                                myController
                                                                    .text))));
                                          }
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                AppLocalizations.of(context)
                                                    .title16,
                                            hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFC8E6CF))),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (myController.text != '') {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeCatogrized(
                                                          CategoryScreenArguments(
                                                              widget.title,
                                                              myController
                                                                  .text))));
                                        }
                                      },
                                      icon: Icon(Icons.search),
                                      color: Color(0xFF39A552),
                                      iconSize: 35,
                                    ),
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
          padding: searchbar
              ? const EdgeInsets.fromLTRB(0, 20, 0, 20)
              : const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: customwidget,
        ),
        elevation: 0,
      ),
    );
  }
}
