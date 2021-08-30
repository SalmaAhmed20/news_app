import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/sources.dart';
import 'package:news_app/reusableWidget/providerLanguage.dart';
import 'package:provider/provider.dart';

Future<SourcesResponse> getNewsSources(String Category,String lang) async {
  //https://newsapi.org/v2/top-headlines/sources?category=business&apiKey=2fa96c132af34256b66520e8e25071bc
  final uri = Uri.https('newsapi.org', 'v2/top-headlines/sources',
      {'category': Category, 'apiKey': 'c63c035b08714bdaba976513fd2077f5',"language":lang});
  final response = await http.get(uri);
  //print(uri.toString());
  print(response.body);
  if (response.statusCode == 200) {
    return SourcesResponse.fromJsonMap(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<NewsResponse> LoadArticals(Sources _sources,String lang,{String Keyword}) async {
  final uri = Uri.https('newsapi.org', '/v2/everything',
      {'sources': _sources.id, 'apiKey': 'c63c035b08714bdaba976513fd2077f5','q':Keyword,"language":lang});
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
