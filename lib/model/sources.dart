class Sources {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;
  Sources.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        description = map["description"],
        url = map["url"],
        category = map["category"],
        language = map["language"],
        country = map["country"];
}
