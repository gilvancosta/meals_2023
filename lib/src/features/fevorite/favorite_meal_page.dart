// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meals_2023/src/features/meals/widget/meal_item_Widget.dart';
import 'package:meals_2023/src/models/meal.dart';

class FavoriteMealPage extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteMealPage({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma Refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItemWidget(favoriteMeals[index]);
        },
      );
    }
  }
}
