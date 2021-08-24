import 'package:flutter/material.dart';
import 'package:news_app/api/APIManger.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';

import '../reusableWidget/TopAppBar.dart';
import '../tabs/HomeTabScreen.dart';
import '../model/SourcesResponse.dart';

class HomeCatogrized extends StatefulWidget {
  final String Category;
  String KeyWord;
  HomeCatogrized(this.Category,{this.KeyWord});

  @override
  _HomeCatogrizedState createState() => _HomeCatogrizedState();
}

class _HomeCatogrizedState extends State<HomeCatogrized> {
  @override
  bool isSearchPage = true;
  Widget customwidget;
  Future<SourcesResponse> newsFuture;
  void initState() {
    super.initState();
    newsFuture = getNewsSources(widget.Category);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: TopBar(isSearchPage, widget.Category),
      ),
      drawer: SideMenu(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/3.0x/pattern@3x.png'),
                fit: BoxFit.fill
            )),
        child: FutureBuilder<SourcesResponse>(
            future: newsFuture,
            builder: (buildcontext, snapshot) {
              if (snapshot.hasData) {
                return HomeTabs(snapshot.data.sources,KeyWord:widget.KeyWord);
              } else if (snapshot.hasError) {
                return IconButton(
                    onPressed: () {
                      setState(() {
                        this.newsFuture = getNewsSources(widget.Category);
                      });
                    },
                    icon: Icon(Icons.refresh));
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ),
    );
  }
}
