import 'package:drawer/api/APIManger.dart';
import 'package:drawer/model/NewsResponse.dart';
import 'package:flutter/material.dart';

import '../model/sources.dart';
import 'NewsListItem.dart';

class NewsFragement extends StatefulWidget {
  Sources _sources;
  NewsFragement(this._sources);

  @override
  _NewsFragementState createState() => _NewsFragementState();
}

class _NewsFragementState extends State<NewsFragement> {
   Future <NewsResponse> _futureNews;
  @override
  void initState()
  {
    super.initState();
    _futureNews=LoadArticals(widget._sources);
  }
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _futureNews,
        builder: (buildcontext,AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (buildcontext,index){

              return NewsListItem(snapshot.data.articles[index]);

            },itemCount: snapshot.data.articles.length,);
          }else if (snapshot.hasError) {
            print ("Error");
            return IconButton(
                onPressed: () {
                  // setState(() {
                  //   this._futureNews = getNewsSources(widget.Category);
                  // });
                },
                icon: Icon(Icons.refresh));
          }
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      ),
    );
  }
}
