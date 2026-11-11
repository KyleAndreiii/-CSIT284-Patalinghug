import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/activity.dart';
import '../providers/favorites_provider.dart';

class FavoriteButton extends StatelessWidget {
  final Activity activity;

  const FavoriteButton({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favorite = favoritesProvider.isFavorite(activity);

        return IconButton(
          onPressed: () {
            favoritesProvider.toggleFavorite(activity);
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Icon(
              favorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(favorite),
              color: favorite ? Colors.red : Colors.grey,
              size: 28,
            ),
          ),
        );
      },
    );
  }
}