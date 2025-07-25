import 'package:flutter/material.dart';
import 'package:web_site/widgets/dashboard_activity_section.dart';
import 'package:web_site/widgets/dashboard_charts_section.dart';
import 'package:web_site/widgets/dashboard_stats_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Cards Section
          const DashboardStatsSection(),
          
          const SizedBox(height: 32),
          
          // Charts and Activity Section
          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth < 900
                  ? const _MobileLayout()
                  : const _DesktopLayout();
            },
          ),
        ],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DashboardChartsSection(),
        SizedBox(height: 32),
        DashboardActivitySection(),
      ],
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: DashboardChartsSection(),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: DashboardActivitySection(),
        ),
      ],
    );
  }
}