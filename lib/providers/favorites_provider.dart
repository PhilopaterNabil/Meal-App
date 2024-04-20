import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal_model.dart';

class FavoritesMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(MealModel meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
    // ScaffoldMessenger.of(context).clearSnackBars();
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       isExisting ? 'Removed from favorites' : 'Added to favorites',
    //     ),
    //     duration: const Duration(seconds: 2),
    //     action: SnackBarAction(
    //       label: 'UNDO',
    //       onPressed: () {
    //           _favoriteMeals.remove(meal);
    //       },
    //     ),
    //   ),
    // );
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<MealModel>>((ref) {
  return FavoritesMealsNotifier();
});
