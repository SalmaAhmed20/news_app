import 'package:flutter/material.dart';
class CategoryGridItem{
  String title;
  String imagePath;
  Color color;
  String category;
  bool isLeftSided;
  BorderRadius borderRadius;
  CategoryGridItem(this.title,this.imagePath,this.color,this.category,this.isLeftSided){
    borderRadius=isLeftSided?BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    ):BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
      bottomRight: Radius.circular(25),);
  }

}