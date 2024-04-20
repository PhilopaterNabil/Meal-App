import 'package:flutter/material.dart';
import 'package:meal/models/category_model.dart';
import 'package:meal/models/meal_model.dart';
import 'package:meal/screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.availableMeals});

  final CategoryModel category;
  final List<MealModel> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<MealModel> filteredMeal = availableMeals
            .where(
              (element) => element.categories.contains(category.id),
            )
            .toList();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealsScreen(
                      title: category.title,
                      meals: filteredMeal,
                    )));
      },
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
