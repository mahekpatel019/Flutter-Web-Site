import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartUtils {
  static const List<String> weekDays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

  static FlTitlesData getWeeklyTitlesData() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) => Text(
            value.toInt() < weekDays.length ? weekDays[value.toInt()] : '',
          ),
          reservedSize: 32,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 32,
        ),
      ),
    );
  }

  static FlTitlesData getWeeklyBarTitlesData() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) => Text(
            value.toInt() < weekDays.length ? weekDays[value.toInt()] : '',
          ),
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true),
      ),
    );
  }

  static BarTouchData getBarTouchData() {
    return BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            '${rod.toY}',
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

  static List<BarChartGroupData> getSampleBarGroups() {
    const List<double> values = [6, 8, 5, 7, 3, 9, 4];
    
    return values.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            color: Colors.teal,
            width: 20,
          ),
        ],
      );
    }).toList();
  }
}