import 'package:flutter/material.dart';
import '../data/analytics_data.dart';
import '../widgets/analytics_card.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Analytics Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: analyticsData.length,
                  itemBuilder: (context, index) {
                    return AnalyticsCard(item: analyticsData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
