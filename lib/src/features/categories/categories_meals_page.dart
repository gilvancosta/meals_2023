// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_2023/src/features/categories/widgets/meal_item_Widget.dart';
import 'package:meals_2023/src/models/category.dart';
import 'package:meals_2023/src/models/meal.dart';

class CategoriesMealsPage extends StatelessWidget {

 //final Category category;


  final List<Meal> meals;
 
  const CategoriesMealsPage(this.meals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItemWidget(categoryMeals[index]);
        },
      ),
    );
  }
}
