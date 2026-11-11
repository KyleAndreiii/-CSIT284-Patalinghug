import 'package:flutter/material.dart';
import '../models/activity.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Activity> _favorites = [];

  List<Activity> get favorites => _favorites;

  bool isFavorite(Activity activity) {
    return _favorites.any((item) => item.id == activity.id);
  }

  void toggleFavorite(Activity activity) {
    if (isFavorite(activity)) {
      _favorites.removeWhere((item) => item.id == activity.id);
    } else {
      _favorites.add(activity);
    }

    notifyListeners();
  }

  void addFavorite(Activity activity) {
    if (!isFavorite(activity)) {
      _favorites.add(activity);
      notifyListeners();
    }
  }

  void removeFavorite(Activity activity) {
    _favorites.removeWhere((item) => item.id == activity.id);
    notifyListeners();
  }
}