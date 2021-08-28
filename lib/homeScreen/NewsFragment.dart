import 'package:flutter/material.dart';
import 'package:news_app/api/APIManger.dart';
import 'package:news_app/homeScreen/NewsListItem.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/reusableWidget/providerLanguage.dart';
import 'package:provider/provider.dart';
import '../model/sources.dart';

class NewsFragement extends StatefulWidget {
  Sources _sources;
  String KeyWord;
  NewsFragement(this._sources,{this.KeyWord});

  @override
  _NewsFragementState createState() => _NewsFragementState();
}

class _NewsFragementState extends State<NewsFragement> {
   Future <NewsResponse> _futureNews;
   providerLanguage provider;
   @override
  void initState()
  {
    super.initState();
  }
  Widget build(BuildContext context) {
    provider = Provider.of<providerLanguage>(context);
    _futureNews=LoadArticals(widget._sources,provider.currentLocale,Keyword:widget.KeyWord);
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
                  setState(() {
                    this._futureNews =LoadArticals(widget._sources,provider.currentLocale);
                  });
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
