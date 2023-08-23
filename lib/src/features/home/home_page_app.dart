// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_2023/src/core/widgets/drawer_widget.dart';
import 'package:meals_2023/src/features/categories/widgets/gridview_categories_widget.dart';
import 'package:meals_2023/src/features/fevorite/favorite_meal_page.dart';
import 'package:meals_2023/src/models/meal.dart';

//import 'package:meals_2023/src/features/favorite/favorite_screen.dart';

class HomePageApp extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const HomePageApp({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  State<HomePageApp> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<HomePageApp> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>> _screens = [];



  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': const GridViewCategoriesWidget()},
      {'title': 'Meus Favoritos', 'screen': FavoriteMealPage(favoriteMeals: widget.favoriteMeals)},
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String,
        ),
      ),
      drawer: const DrawerWidget(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        //faz uma animação - tem que ajustar as cores no buttom
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
