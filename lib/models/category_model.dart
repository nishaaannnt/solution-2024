import 'package:flutter/material.dart';

class CategoryModel 
{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.boxColor,
    required this.iconPath,
    required this.name,
  });
 
 static List<CategoryModel> getCategories()
 {
    List<CategoryModel> categories = [];

    categories.addAll([
      CategoryModel(boxColor: Color.fromARGB(255, 38, 176, 251), iconPath: 'assets/icons/plate.svg', name: 'Salad'),
      CategoryModel(boxColor: Color.fromARGB(255, 170, 255, 0), iconPath: 'assets/icons/honey-pancakes.svg', name: 'Cake'),
      CategoryModel(boxColor: Color.fromARGB(255, 15, 183, 0), iconPath: 'assets/icons/pie.svg', name: 'Pie'),
      CategoryModel(boxColor: Color.fromARGB(255, 197, 0, 184), iconPath: 'assets/icons/orange-snacks.svg', name: 'Smoothies'),
    ]);

    return categories;
 }
}