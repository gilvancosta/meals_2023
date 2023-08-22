import 'package:flutter/material.dart';

import 'package:meals_2023/src/features/home/home_page_app.dart';
import 'package:meals_2023/src/features/categories/categories_meals_page.dart';
import 'package:meals_2023/src/features/meals/meal_detail_page.dart';
import 'package:meals_2023/src/features/categories/settings/categorie_settings_page.dart';


import 'package:meals_2023/src/core/data/dummy_data.dart';
import 'package:meals_2023/src/core/ui/theme/app_theme.dart';
import 'package:meals_2023/src/core/utls/app_routes.dart';

// models
import 'package:meals_2023/src/models/meal.dart';
import 'package:meals_2023/src/models/settings.dart';




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings       = Settings();

  List<Meal> _availableMeals = dummyMeals;

  void _filterMeals(Settings settings) {

    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: MyAppTheme.themeData,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => const HomePageApp(),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsPage(_availableMeals),
        AppRoutes.mealDetail: (ctx) => const MealDetailPage(),
        AppRoutes.settings: (ctx) => SettingsPage(settings, _filterMeals),
      },
    );
  }
}
