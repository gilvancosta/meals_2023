import 'package:flutter/material.dart';

import 'package:meals_2023/src/features/home/home_page_app.dart';
import 'package:meals_2023/src/features/categories/categories_meals_page.dart';
import 'package:meals_2023/src/features/meals/meal_detail_page.dart';
import 'package:meals_2023/src/features/settings/categorie_settings_page.dart';

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

  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];
  



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

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

 bool _isFavotite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: MyAppTheme.themeData,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) =>  HomePageApp(favoriteMeals: _favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsPage(_availableMeals),
        AppRoutes.mealDetail: (ctx) =>  MealDetailPage(onToggleFavorite: _toggleFavorite, isFavotite: _isFavotite),
        AppRoutes.settings: (ctx) => SettingsPage(settings, _filterMeals),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(builder: (_) {
            return HomePageApp(favoriteMeals: _favoriteMeals);
          });
        }
      },
      // funciona tipo fosse uma página 404
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return HomePageApp(favoriteMeals: _favoriteMeals);
        });
      },
    );
  }
}
