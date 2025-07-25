import 'package:flutter/material.dart';

class StatCardModel {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String change;

  const StatCardModel({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.change,
  });
}