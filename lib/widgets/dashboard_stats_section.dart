import 'package:flutter/material.dart';
import '../models/stat_card_model.dart';
import 'stat_card_widget.dart';

class DashboardStatsSection extends StatelessWidget {
  const DashboardStatsSection({Key? key}) : super(key: key);

  static const List<StatCardModel> _statsData = [
    StatCardModel(
      title: 'Total Sales',
      value: '₹2,45,670',
      icon: Icons.trending_up,
      color: Colors.green,
      change: '+12.5%',
    ),
    StatCardModel(
      title: 'Orders',
      value: '1,234',
      icon: Icons.shopping_cart,
      color: Colors.blue,
      change: '+8.2%',
    ),
    StatCardModel(
      title: 'Customers',
      value: '856',
      icon: Icons.people,
      color: Colors.orange,
      change: '+15.3%',
    ),
    StatCardModel(
      title: 'Revenue',
      value: '₹1,98,450',
      icon: Icons.account_balance_wallet,
      color: Colors.purple,
      change: '+22.1%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? _buildMobileStats()
            : _buildDesktopStats();
      },
    );
  }

  Widget _buildMobileStats() {
    return Column(
      children: _statsData
          .map((stat) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: StatCardWidget(stat: stat),
              ))
          .toList(),
    );
  }

  Widget _buildDesktopStats() {
    const double cardWidth = 240;
    const double spacing = 20;

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: WrapAlignment.start,
      children: _statsData
          .map((stat) => SizedBox(
                width: cardWidth,
                child: StatCardWidget(stat: stat),
              ))
          .toList(),
    );
  }
}