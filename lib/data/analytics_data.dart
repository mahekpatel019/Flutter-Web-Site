import 'package:flutter/material.dart';
import '../models/analytics_item.dart';

const List<AnalyticsItem> analyticsData = [
  AnalyticsItem(
    title: 'Total Sales',
    value: '\$12,345',
    icon: Icons.attach_money,
    color: Colors.green,
  ),
  AnalyticsItem(
    title: 'New Users',
    value: '1,234',
    icon: Icons.person_add,
    color: Colors.blue,
  ),
  AnalyticsItem(
    title: 'Page Views',
    value: '56,789',
    icon: Icons.visibility,
    color: Colors.purple,
  ),
  AnalyticsItem(
    title: 'Conversion Rate',
    value: '3.5%',
    icon: Icons.trending_up,
    color: Colors.orange,
  ),
  AnalyticsItem(
    title: 'Bounce Rate',
    value: '45%',
    icon: Icons.broken_image,
    color: Colors.red,
  ),
];
