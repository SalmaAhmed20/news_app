import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providerLanguage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class setting extends StatefulWidget{
  @override
  _setting createState() => _setting();
}
class _setting extends State<setting> {
  List<String> _languages = ['English', 'Arabic'];
  String _ItemSelected = 'English';
   providerLanguage provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<providerLanguage>(context);
    return Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu,size: 30 ),
          centerTitle: true,
          title: Text(AppLocalizations.of(context).title11, style: TextStyle(fontFamily: 'ElMessiri',
              color: Colors.white), textAlign: TextAlign.center,),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage("assets/images/pattern@3x.png"),
                fit: BoxFit.fill),
          )
          // ignore: unnecessary_new
          , child: new Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('\n'+'      '+AppLocalizations.of(context).title12,style: TextStyle(fontFamily: 'ElMessiri',
                      color: Colors.black87, fontWeight: FontWeight.bold,fontSize:18) ,)),
              Center( child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                      padding: EdgeInsets.only(left: 10, right:10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1),
                      ),

                      child: DropdownButton<String>(

                        isExpanded: true,

                        dropdownColor: Colors.white60,
                        icon: Icon(Icons.keyboard_arrow_down,color: Colors.green),
                        iconSize: 25,

                        items: _languages.map((_var) {
                          return DropdownMenuItem(
                            value:_var,
                            child: Text(_var,style:TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            //localization
                            if(newValue == 'Arabic'){
                              provider.changeLanguage("ar");
                              Navigator.pop(context);
                            }else{
                              provider.changeLanguage("en");
                              Navigator.pop(context);
                            }
                            _ItemSelected = newValue;
                          });
                        },
                        value: _ItemSelected,

                      )
                  )
              )
              )
            ]
        ),)
    );
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}