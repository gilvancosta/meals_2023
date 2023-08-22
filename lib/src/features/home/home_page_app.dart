import 'package:flutter/material.dart';
import 'package:meals_2023/src/core/widgets/drawer_widget.dart';
import 'package:meals_2023/src/features/home/widgets/favorite_meal_widget.dart';
import 'package:meals_2023/src/features/home/widgets/gridview_categories_widget.dart';

//import 'package:meals_2023/src/features/favorite/favorite_screen.dart';


class HomePageApp extends StatefulWidget {
  const HomePageApp({Key? key}) : super(key: key);

  @override
  State<HomePageApp> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<HomePageApp> {
  int _selectedScreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': const GridViewCategoriesWidget()},
    {'title': 'Meus Favoritos', 'screen': const FavoriteMealWidget()},
  ];

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
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
