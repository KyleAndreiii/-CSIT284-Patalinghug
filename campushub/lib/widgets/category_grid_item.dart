import 'package:flutter/material.dart';
import '../models/activity_category.dart';

class CategoryGridItem extends StatelessWidget {
  final ActivityCategory category;
  final VoidCallback onSelectCategory;

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  IconData getCategoryIcon() {
    switch (category.id) {
      case 'c1':
        return Icons.computer;
      case 'c2':
        return Icons.science;
      case 'c3':
        return Icons.emoji_events;
      case 'c4':
        return Icons.work;
      case 'c5':
        return Icons.groups;
      case 'c6':
        return Icons.volunteer_activism;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: category.color.withOpacity(0.4),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              getCategoryIcon(),
              size: 45,
              color: category.color,
            ),
            const SizedBox(height: 12),
            Text(
              category.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}