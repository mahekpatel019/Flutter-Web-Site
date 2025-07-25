import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'chart_container.dart';
import '../../utils/chart_utils.dart';

class SalesBarChartWidget extends StatelessWidget {
  const SalesBarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 10,
          minY: 0,
          barTouchData: ChartUtils.getBarTouchData(),
          titlesData: ChartUtils.getWeeklyBarTitlesData(),
          borderData: FlBorderData(show: false),
          barGroups: ChartUtils.getSampleBarGroups(),
        ),
      ),
    );
  }
}