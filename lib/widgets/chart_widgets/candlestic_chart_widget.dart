import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'chart_container.dart';
import '../../utils/chart_utils.dart';

class SalesCandlestickChartWidget extends StatelessWidget {
  const SalesCandlestickChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Custom chart container
    return ChartContainer(
      child: CandlestickChart(
        CandlestickChartData(
          candlestickSpots: ChartUtils.getSampleCandlestickData(),
          maxY: 10,
          minY: 0,
          titlesData: ChartUtils.getCandlestickTitlesData(),
          gridData: ChartUtils.getCandlestickGridData(),
          borderData: ChartUtils.getCandlestickBorderData(),
        ),
      ),
    );
  }
}