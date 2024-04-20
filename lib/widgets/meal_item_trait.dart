import 'package:flutter/material.dart';

class MealItemTriet extends StatelessWidget {
  const MealItemTriet({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
