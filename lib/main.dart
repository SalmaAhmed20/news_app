import 'package:flutter/material.dart';
import 'package:news_app/homeScreen/Home-Catagorized.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'splashScreen/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:news_app/reusableWidget/providerLanguage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   providerLanguage provider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of< providerLanguage>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales :AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale.fromSubtags(languageCode: provider.currentLocale),
      title: AppLocalizations.of(context).title,
      theme: ThemeData(
        primaryColor: Color(0xFF39A552),
      ),
      home: SplashScreen(),

    );
  }
}
