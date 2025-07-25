import 'package:flutter/material.dart';

class AnalyticsItem {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const AnalyticsItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}
