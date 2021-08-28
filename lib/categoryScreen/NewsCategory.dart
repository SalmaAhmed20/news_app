import 'CategoryGridItem.dart';
import 'package:flutter/material.dart';
import 'CategoryMenu.dart';
import 'Appbar.dart';
class NewsCategory extends StatefulWidget {
  Function onCategoryItemClick;
  NewsCategory();

  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  List<CategoryGridItem>data;

  @override
  Widget build(BuildContext context) {
    data = getCategoriesList();
    return Scaffold(
      appBar: MyAppbar(title:"New Menu",),
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
                    "pick your category of interest",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PoppinsBold',
                      color: Color.fromRGBO(79, 90, 105, 1.0),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12
                    ) ,
                    itemBuilder: (buildContext,index)=>CategoryMenu(data[index]
                      //widget.onCategoryItemClick
                    ),
                    itemCount: data.length,

                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  /*void onCategoryItemClick(CategoryGridItem category){
    setState(() {
      //selectedCategory = category;
      //title = category.title;
    });
  }*/

  List<CategoryGridItem> getCategoriesList(){
    List<CategoryGridItem> list = [
      CategoryGridItem(
          'sports',
          'assets/images/sports.png',
          Color.fromARGB(255, 201, 28, 34),
          true),
      CategoryGridItem(
          'politics',
          'assets/images/Politics.png',
          Color.fromARGB(255, 0,62, 144),
          false),
      CategoryGridItem(
          'health',
          'assets/images/health.png',
          Color.fromARGB(255, 237,30, 121),
          true),
      CategoryGridItem(
          'business',
          'assets/images/bussines.png',
          Color.fromARGB(255, 207,126, 72),
          false),
      CategoryGridItem(
          'Environment',
          'assets/images/environment.png',
          Color.fromARGB(255, 72,130, 207),
          true
      ),
      CategoryGridItem(
          'science',
          'assets/images/science.png',
          Color.fromARGB(255, 242,211, 82),
          false)
    ];
    return list;
  }
}
