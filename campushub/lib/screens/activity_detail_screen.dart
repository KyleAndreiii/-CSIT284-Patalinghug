
import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/favorite_button.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;

  const ActivityDetailScreen({
    super.key,
    required this.activity,
  });

  String getSkillLevel() {
    switch (activity.skillLevel) {
      case SkillLevel.beginner:
        return 'Beginner';
      case SkillLevel.intermediate:
        return 'Intermediate';
      case SkillLevel.advanced:
        return 'Advanced';
    }
  }

  String getDuration() {
    final hours = activity.duration ~/ 60;
    final minutes = activity.duration % 60;

    if (hours == 0) {
      return '$minutes minutes';
    }

    if (minutes == 0) {
      return '$hours hours';
    }

    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
        actions: [
          FavoriteButton(activity: activity),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: activity.id,
              child: Image.network(
                activity.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(activity.description),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Venue'),
                    subtitle: Text(activity.venue),
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Duration'),
                    subtitle: Text(getDuration()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.bar_chart),
                    title: const Text('Skill Level'),
                    subtitle: Text(getSkillLevel()),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Requirements',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...activity.requirements.map(
                    (item) => ListTile(
                      leading: const Icon(Icons.check_circle_outline),
                      title: Text(item),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Benefits',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...activity.benefits.map(
                    (item) => ListTile(
                      leading: const Icon(Icons.star_outline),
                      title: Text(item),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
