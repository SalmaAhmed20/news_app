
import 'package:flutter/material.dart';
import 'package:news_app/api/APIManger.dart';
import 'package:news_app/reusableWidget/providerLanguage.dart';
import 'package:provider/provider.dart';
import '../tabs/HomeTabScreen.dart';
import '../model/SourcesResponse.dart';

class CategoryScreenArguments {
  final String category;
  final String KeyWord;
  CategoryScreenArguments(this.category, this.KeyWord);
}

class HomeCatogrized extends StatefulWidget {
  final CategoryScreenArguments category;
  HomeCatogrized(this.category);

  @override
  _HomeCatogrizedState createState() => _HomeCatogrizedState();
}

class _HomeCatogrizedState extends State<HomeCatogrized> {
  bool isSearchPage = true;
  Widget customwidget;
  ProviderLanguage provider;
  Future<SourcesResponse> newsFuture;
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    provider = Provider.of<ProviderLanguage>(context);
    newsFuture = getNewsSources(widget.category.category,provider.currentLocale);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/3.0x/pattern@3x.png'),
                fit: BoxFit.fill)),
        child: FutureBuilder<SourcesResponse>(
            future: newsFuture,
            builder: (buildcontext, snapshot) {
              if (snapshot.hasData) {
                return HomeTabs(snapshot.data.sources,
                    KeyWord: widget.category.KeyWord);
              } else if (snapshot.hasError) {
                return IconButton(
                    onPressed: () {
                      setState(() {
                        this.newsFuture =
                            getNewsSources(widget.category.category,provider.currentLocale);
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