import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class providerLanguage extends ChangeNotifier{
 String currentLocale = 'en';
providerLanguage(bool isEng){
  if(isEng)
    this.currentLocale ='en';
  else
    this.currentLocale ='ar';
}
Future<void> changeLanguage(String language) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (language == 'en') {
    prefs.setBool("isEng", true);
    currentLocale = language;
  } else {
    prefs.setBool("isEng", false);
    currentLocale = language;
  }
  notifyListeners();
}

}