import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/activity_category.dart';
import '../widgets/activity_card.dart';
import 'activity_detail_screen.dart';

class ActivitiesScreen extends StatelessWidget {
  final ActivityCategory category;

  const ActivitiesScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final activities = dummyActivities
        .where((activity) => activity.categories.contains(category.id))
        .toList();

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: activities.isEmpty
          ? const Center(
              child: Text('No activities available in this category.'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: activities.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > 1000 ? 3 : width > 600 ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: width > 600 ? 0.85 : 1.15,
              ),
              itemBuilder: (context, index) {
                final activity = activities[index];

                return ActivityCard(
                  activity: activity,
                  onSelectActivity: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityDetailScreen(
                          activity: activity,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}