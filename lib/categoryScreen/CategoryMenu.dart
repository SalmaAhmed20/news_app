import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CategoryGridItem.dart';

class CategoryMenu extends StatelessWidget {

  static const routeName = "Category Menu";
  CategoryGridItem category;
  Function onCategoryItemClick;
  CategoryMenu(this. category);
  // , this.onCategoryItemClick

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 170,
        width: 150,
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: category.borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              category.imagePath,
              height: 114,
            ),
            Text(
              category.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Exo',
              ),
            )
          ],
        ),
      ),
    );
    //);
  }
}
