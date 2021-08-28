import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/reusableWidget/SideMenu.dart';
import 'package:provider/provider.dart';
import 'providerLanguage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class setting extends StatefulWidget {
  @override
  _setting createState() => _setting();
}

class _setting extends State<setting> {
  List<String> _languages;
  String _ItemSelected;
  providerLanguage provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<providerLanguage>(context);
    _languages = [
      AppLocalizations.of(context).title14,
      AppLocalizations.of(context).title15
    ];
    _ItemSelected = AppLocalizations.of(context).title14;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context).title11,
            style: TextStyle(fontFamily: 'Exo', color: Colors.white),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
          backgroundColor: Colors.green,
        ),
        drawer: SideMenu(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage("assets/images/3.0x/pattern@3x.png"),
                fit: BoxFit.fill),
          ),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '\n' + '      ' + AppLocalizations.of(context).title12,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 1),
                            ),
                            child: DropdownButton<String>(
                              elevation: 0,
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.green),
                              iconSize: 25,
                              items: _languages.map((_var) {
                                return DropdownMenuItem(
                                  value: _var,
                                  child: Text(
                                    _var,
                                    style: TextStyle(
                                      fontFamily: "Arial",
                                      color: Colors.green,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  //localization
                                  if (newValue ==
                                      AppLocalizations.of(context).title15) {
                                    provider.changeLanguage("ar");
                                  } else {
                                    provider.changeLanguage("en");
                                  }
                                  _ItemSelected = newValue;
                                });
                              },
                              value: _ItemSelected,
                            ))))
              ]),
        ));
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
