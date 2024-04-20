import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal_model.dart';
import 'package:meal/providers/favorites_provider.dart';
import 'package:meal/providers/filters_provider.dart';
import 'package:meal/providers/nav_bar_provider.dart';
import 'package:meal/screens/categoires_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MealModel> availableMeals = ref.watch(filtersMealsProvider);
    final int selectedPageIndex = ref.watch(navBarProvider);

    Widget activePage = CategoiresScreen(availableMeals: availableMeals);
    var activePageTitle = 'Pick your categories';

    if (selectedPageIndex == 1) {
      final List<MealModel> favoriteMeal = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        centerTitle: true,
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: (String identifier) {
          Navigator.of(context).pop();
          if (identifier == 'filters') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const FiltersScreen();
                },
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.watch(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
