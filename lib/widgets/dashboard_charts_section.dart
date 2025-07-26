import 'package:flutter/material.dart';
import 'package:web_site/widgets/chart_widgets/candlestic_chart_widget.dart';
import 'chart_widgets/line_chart_widget.dart';
import 'chart_widgets/bar_chart_widget.dart';

class DashboardChartsSection extends StatelessWidget {
  const DashboardChartsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sa',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const SalesLineChartWidget(),
            const SizedBox(height: 20),
            const SalesBarChartWidget(),
            const SizedBox(height: 20),
            const SalesCandlestickChartWidget(),
          ],
        ),
      ),
    );
  }
}
