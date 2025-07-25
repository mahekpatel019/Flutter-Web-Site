import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  final Widget child;
  final double height;

  const ChartContainer({
    super.key,
    required this.child,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: child),
    );
  }
}