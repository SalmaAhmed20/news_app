import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CategoryGridItem.dart';

class CategoryMenu extends StatelessWidget {

  static const routeName = "Category Menu";
  CategoryGridItem category;
  Function onCategoryItemClick;
  CategoryMenu(this. category,this.onCategoryItemClick);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        onCategoryItemClick(category);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: category.borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Image.asset(
                category.imagePath,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical:5,horizontal: 0),
              child: Text(
                category.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  fontFamily: 'Exo',
                ),
              ),
            )
          ],
        ),
      ),
    );
    //);
  }
}