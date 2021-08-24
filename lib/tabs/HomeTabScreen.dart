import 'package:drawer/home%20screen/NewsFragment.dart';
import 'package:flutter/material.dart';


import 'TabItem.dart';
import '../model/sources.dart';

class HomeTabs extends StatefulWidget {
   List<Sources> _sources;
  HomeTabs(this._sources);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int Selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget._sources.length,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    this.Selectedindex = index;
                  });
                },
                tabs: widget._sources
                    .map((source) => TabItem(source,
                        widget._sources.indexOf(source) == Selectedindex))
                    .toList()),
          ),Expanded(
            child: TabBarView(children:
              widget._sources.map((source) => NewsFragement(source)).toList(),

            ),
          )
        ],
      ),
    );
  }
}
