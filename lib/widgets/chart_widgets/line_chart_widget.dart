import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'chart_container.dart';
import '../../utils/chart_utils.dart';

class SalesLineChartWidget extends StatelessWidget {
  const SalesLineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 10,
          gridData: FlGridData(show: true),
          titlesData: ChartUtils.getWeeklyTitlesData(),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3), FlSpot(1, 4), FlSpot(2, 7),
                FlSpot(3, 6), FlSpot(4, 8), FlSpot(5, 5), FlSpot(6, 9),
              ],
              isCurved: true,
              color: Colors.teal,
              barWidth: 4,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}