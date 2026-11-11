import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/category_grid_item.dart';
import 'activities_screen.dart';
import 'favorites_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusHub'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Campus Activities',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Discover workshops, seminars, and campus events.',
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: availableCategories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > 900 ? 4 : width > 600 ? 3 : 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final category = availableCategories[index];

                  return CategoryGridItem(
                    category: category,
                    onSelectCategory: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivitiesScreen(
                            category: category,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}