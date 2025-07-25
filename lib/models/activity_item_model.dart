import 'package:flutter/material.dart';

class ActivityItemModel {
  final String title;
  final String description;
  final String time;
  final IconData icon;

  const ActivityItemModel({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
  });
}
