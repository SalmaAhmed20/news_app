import 'dart:convert';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/sources.dart';

Future<SourcesResponse> getNewsSources(String Category) async {
  //https://newsapi.org/v2/top-headlines/sources?category=business&apiKey=2fa96c132af34256b66520e8e25071bc
  final uri = Uri.https('newsapi.org', 'v2/top-headlines/sources',
      {'category': Category, 'apiKey': '2fa96c132af34256b66520e8e25071bc'});
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return SourcesResponse.fromJsonMap(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<NewsResponse> LoadArticals(Sources _sources,{String Keyword}) async {
  if(Keyword=='')
    Keyword=_sources.category;
  final uri = Uri.https('newsapi.org', '/v2/everything',
      {'sources': _sources.id, 'apiKey': '2fa96c132af34256b66520e8e25071bc','q':Keyword});
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
