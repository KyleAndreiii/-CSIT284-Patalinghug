import 'package:flutter/material.dart';
import '../models/activity.dart';
import 'favorite_button.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onSelectActivity;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.onSelectActivity,
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
    if (activity.duration >= 60) {
      final hours = activity.duration ~/ 60;
      final minutes = activity.duration % 60;

      if (minutes == 0) {
        return '$hours hour${hours > 1 ? 's' : ''}';
      }

      return '${hours}h ${minutes}m';
    }

    return '${activity.duration} minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onSelectActivity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: activity.id,
                  child: Image.network(
                    activity.imageUrl,
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 160,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: FavoriteButton(activity: activity),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 17),
                      const SizedBox(width: 6),
                      Text(getDuration()),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.bar_chart, size: 17),
                      const SizedBox(width: 6),
                      Text(getSkillLevel()),
                    ],
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