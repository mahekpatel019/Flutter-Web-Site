import 'package:flutter/material.dart';
import '../models/activity_item_model.dart';
import 'activity_item_widget.dart';

class DashboardActivitySection extends StatelessWidget {
  const DashboardActivitySection({Key? key}) : super(key: key);

  static final List<ActivityItemModel> _activities = List.generate(
    5,
    (index) => ActivityItemModel(
      title: 'Order #${1000 + index}',
      description: 'New order received from customer',
      time: '${index + 1}h ago',
      icon: Icons.shopping_bag,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            ..._activities.map(
              (activity) => ActivityItemWidget(activity: activity),
            ),
          ],
        ),
      ),
    );
  }
}