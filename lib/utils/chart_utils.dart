// ignore_for_file: deprecated_member_use

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

  // Candlestick Chart Utils
  static List<CandlestickSpot> getSampleCandlestickData() {
    return [
      CandlestickSpot(x: 0, high: 8.5, low: 3.2, open: 4.1, close: 7.8),
      CandlestickSpot(x: 1, high: 9.1, low: 6.5, open: 7.8, close: 8.9),
      CandlestickSpot(x: 2, high: 9.5, low: 5.8, open: 8.9, close: 6.2),
      CandlestickSpot(x: 3, high: 7.9, low: 4.1, open: 6.2, close: 7.5),
      CandlestickSpot(x: 4, high: 8.8, low: 6.9, open: 7.5, close: 8.3),
      CandlestickSpot(x: 5, high: 9.7, low: 7.2, open: 8.3, close: 9.1),
      CandlestickSpot(x: 6, high: 9.9, low: 6.1, open: 9.1, close: 6.8),
    ];
  }

  static FlTitlesData getCandlestickTitlesData() {
    return FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, meta) {
            return Text(
              '\${value.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            if (value.toInt() < weekDays.length) {
              return Text(
                weekDays[value.toInt()],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              );
            }
            return const Text('');
          },
        ),
      ),
    );
  }

  static FlGridData getCandlestickGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey.withOpacity(0.3),
          strokeWidth: 0.5,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey.withOpacity(0.3),
          strokeWidth: 0.5,
        );
      },
    );
  }

  static FlBorderData getCandlestickBorderData() {
    return FlBorderData(
      show: true,
      border: Border.all(
        color: Colors.grey.withOpacity(0.5),
        width: 1,
      ),
    );
  }
}