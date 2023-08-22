import 'package:flutter/material.dart';
import 'package:meals_2023/src/features/meals/meal_item_page.dart';
import 'package:meals_2023/src/models/category.dart';
import 'package:meals_2023/src/models/meal.dart';

class CategoriesMealsPage extends StatelessWidget {
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
          return MealItemPage(categoryMeals[index]);
        },
      ),
    );
  }
}
