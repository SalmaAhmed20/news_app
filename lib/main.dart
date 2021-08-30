import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'reusableWidget/providerLanguage.dart';
import 'splashScreen/SplashScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      child: MyApp(),
      create: (BuildContext context) =>
          providerLanguage(((prefs.getBool("isEng") ?? false)))));
}

class MyApp extends StatelessWidget {
  providerLanguage provider;
  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<providerLanguage>(context);
    return Consumer<providerLanguage>(builder: (context, theme, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale.fromSubtags(languageCode: provider.currentLocale),
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            primaryColor: Color(0xFF39A552),
          ),
          home: SplashScreen());
    });
  }
}