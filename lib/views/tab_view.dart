import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/views/categories_view.dart';
import 'package:meal_app/views/filter_view.dart';
import 'package:meal_app/views/main_drawer.dart';
import 'package:meal_app/views/meals_view.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _selectedIndex = 0;
  void _onselectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<MealModel> _favoriteMeals = [];
  void _toggleFavoratemeal(MealModel meal) {
    final isexisting = _favoriteMeals.contains(meal);
    if (isexisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Removed from favorite');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Added to favorite');
      });
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(message),
      ),
    );
  }

  Map<Filter, bool> filters = {
    Filter.gluten: false,
    Filter.lactose: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };
  void setScreen(identifier) {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => const FilterView(),
            ),
          )
          .then((value) => setState(() {
                filters = value;
              }));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesView(toggleFavorite: _toggleFavoratemeal);
    var activePageTitle = 'Categories';
    if (_selectedIndex == 1) {
      activePage = MealsView(
        items: _favoriteMeals,
        toggleFavorite: _toggleFavoratemeal,
      );
      activePageTitle = 'Favorite';
    }

    return Scaffold(
      drawer: MainDrawer(
        onselected: setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onselectItem,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favorite'),
          ]),
    );
  }
}
