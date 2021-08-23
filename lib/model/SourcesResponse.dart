import 'package:news_app/model/sources.dart';

class SourcesResponse {

  String status;
  List<Sources> sources;

	SourcesResponse.fromJsonMap(Map<String, dynamic> map):
		status = map["status"],
		sources = List<Sources>.from(map["sources"].map((it) => Sources.fromJsonMap(it)));

}
