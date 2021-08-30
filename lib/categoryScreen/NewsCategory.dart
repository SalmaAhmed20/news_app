import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'CategoryGridItem.dart';
import 'package:flutter/material.dart';
import 'CategoryMenu.dart';
class NewsCategory extends StatefulWidget {
  Function onCategoryItemClick;
  NewsCategory(this.onCategoryItemClick);

  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  List<CategoryGridItem>data;

  @override
  Widget build(BuildContext context) {
    data = getCategoriesList();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    AppLocalizations.of(context).title2 ,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color.fromRGBO(79, 90, 105, 1.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                          //mainAxisSpacing: 12,
                          crossAxisSpacing: 12
                      ) ,
                      itemBuilder: (buildContext,index)=>CategoryMenu(data[index],
                          widget.onCategoryItemClick
                      ),
                      itemCount: data.length,

                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  List<CategoryGridItem> getCategoriesList(){
    List<CategoryGridItem> list = [
      CategoryGridItem(
          AppLocalizations.of(context).title3,
          'assets/images/sports.png',
          Color.fromARGB(255, 201, 28, 34),
          "sports",
          true),
      CategoryGridItem(
          AppLocalizations.of(context).title4,
          'assets/images/Politics.png',
          Color.fromARGB(255, 0,62, 144),
          'politics',
          false),
      CategoryGridItem(
          AppLocalizations.of(context).title5,
          'assets/images/health.png',
          Color.fromARGB(255, 237,30, 121),
          'health',
          true),
      CategoryGridItem(
          AppLocalizations.of(context).title6,
          'assets/images/bussines.png',
          Color.fromARGB(255, 207,126, 72),
          'business',
          false),
      CategoryGridItem(
          AppLocalizations.of(context).title7,
          'assets/images/environment.png',
          Color.fromARGB(255, 72,130, 207),
          'Environment',
          true
      ),
      CategoryGridItem(
          AppLocalizations.of(context).title10,
          'assets/images/science.png',
          Color.fromARGB(255, 242,211, 82),
          'science',
          false)
    ];
    return list;
  }
}