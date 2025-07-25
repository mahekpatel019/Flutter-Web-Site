// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:web_site/widgets/statcard_widget.dart';
// // Assuming statcard_widget.dart contains buildStatCard and buildActivityItem
// // You might want to rename statcard_widget.dart to something more generic
// // like dashboard_widgets.dart if it contains buildActivityItem as well.

// Widget buildDashboardContent(BuildContext context) {
//   return SingleChildScrollView(
//     padding: const EdgeInsets.all(32),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Responsive Stats Cards Row
//         _buildStatsCards(context),

//         const SizedBox(height: 32),

//         // Responsive Chart and Recent Activity Section
//         _buildChartAndActivitySection(context),
//       ],
//     ),
//   );
// }

// // --- Helper methods for better organization and readability ---

// Widget _buildStatsCards(BuildContext context) {
//   // Use LayoutBuilder to react to the available width for the stat cards
//   return LayoutBuilder(
//     builder: (context, constraints) {
//       final screenWidth = constraints.maxWidth;
//       const double cardWidth = 240; // Ideal width for a single stat card
//       (screenWidth / cardWidth).floor();
//       final double spacing = 20;

//       // Using Wrap to allow cards to wrap to the next line on smaller screens
//       // or GridView.builder for more structured grid behavior.
//       if (screenWidth < 600) {
//         // Example breakpoint for mobile
//         return Column(
//           children: [
//             buildStatCard(
//               'Total Sales',
//               '₹2,45,670',
//               Icons.trending_up,
//               Colors.green,
//               '+12.5%',
//               context,
//             ),
//             const SizedBox(height: 20),
//             buildStatCard(
//               'Orders',
//               '1,234',
//               Icons.shopping_cart,
//               Colors.blue,
//               '+8.2%',
//               context,
//             ),
//             const SizedBox(height: 20),
//             buildStatCard(
//               'Customers',
//               '856',
//               Icons.people,
//               Colors.orange,
//               '+15.3%',
//               context,
//             ),
//             const SizedBox(height: 20),
//             buildStatCard(
//               'Revenue',
//               '₹1,98,450',
//               Icons.account_balance_wallet,
//               Colors.purple,
//               '+22.1%',
//               context,
//             ),
//           ],
//         );
//       } else {
//         // For larger screens, use a Wrap or Row with Expanded
//         return Wrap(
//           spacing: spacing, // Horizontal space between cards
//           runSpacing: spacing, // Vertical space between wrapped lines
//           alignment: WrapAlignment.start, // Align items to the start
//           children: [
//             SizedBox(
//               width: cardWidth, // Give each card a preferred width
//               child: buildStatCard(
//                 'Total Sales',
//                 '₹2,45,670',
//                 Icons.trending_up,
//                 Colors.green,
//                 '+12.5%',
//                 context,
//               ),
//             ),
//             SizedBox(
//               width: cardWidth,
//               child: buildStatCard(
//                 'Orders',
//                 '1,234',
//                 Icons.shopping_cart,
//                 Colors.blue,
//                 '+8.2%',
//                 context,
//               ),
//             ),
//             SizedBox(
//               width: cardWidth,
//               child: buildStatCard(
//                 'Customers',
//                 '856',
//                 Icons.people,
//                 Colors.orange,
//                 '+15.3%',
//                 context,
//               ),
//             ),
//             SizedBox(
//               width: cardWidth,
//               child: buildStatCard(
//                 'Revenue',
//                 '₹1,98,450',
//                 Icons.account_balance_wallet,
//                 Colors.purple,
//                 '+22.1%',
//                 context,
//               ),
//             ),
//           ],
//         );
//       }
//     },
//   );
// }

// Widget _buildChartAndActivitySection(BuildContext context) {
//   return LayoutBuilder(
//     builder: (context, constraints) {
//       final screenWidth = constraints.maxWidth;

//       if (screenWidth < 900) {
//         // Example breakpoint for stacking on smaller screens
//         return Column(
//           children: [
//             // Chart Section
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Sales Overview',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // Line Chart
//                     _buildChartContainer(
//                       context,
//                       LineChart(
//                         LineChartData(
//                           minX: 0,
//                           maxX: 6,
//                           minY: 0,
//                           maxY: 10,
//                           gridData: FlGridData(show: true),
//                           titlesData: FlTitlesData(
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, _) {
//                                   switch (value.toInt()) {
//                                     case 0:
//                                       return const Text('Mon');
//                                     case 1:
//                                       return const Text('Tue');
//                                     case 2:
//                                       return const Text('Wed');
//                                     case 3:
//                                       return const Text('Thu');
//                                     case 4:
//                                       return const Text('Fri');
//                                     case 5:
//                                       return const Text('Sat');
//                                     case 6:
//                                       return const Text('Sun');
//                                   }
//                                   return const Text('');
//                                 },
//                                 reservedSize: 32,
//                               ),
//                             ),
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 reservedSize: 32,
//                               ),
//                             ),
//                           ),
//                           borderData: FlBorderData(show: true),
//                           lineBarsData: [
//                             LineChartBarData(
//                               spots: const [
//                                 FlSpot(0, 3),
//                                 FlSpot(1, 4),
//                                 FlSpot(2, 7),
//                                 FlSpot(3, 6),
//                                 FlSpot(4, 8),
//                                 FlSpot(5, 5),
//                                 FlSpot(6, 9),
//                               ],
//                               isCurved: true,
//                               color: Colors.teal,
//                               barWidth: 4,
//                               dotData: FlDotData(show: true),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20), // Spacing between charts
//                     // Bar Chart
//                     _buildChartContainer(
//                       context,
//                       BarChart(
//                         BarChartData(
//                           alignment: BarChartAlignment.spaceAround,
//                           maxY: 10,
//                           minY: 0,
//                           barTouchData: BarTouchData(
//                             enabled: true,
//                             touchTooltipData: BarTouchTooltipData(
//                               getTooltipItem:
//                                   (group, groupIndex, rod, rodIndex) {
//                                     return BarTooltipItem(
//                                       '${rod.toY}',
//                                       const TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     );
//                                   },
//                             ),
//                           ),
//                           titlesData: FlTitlesData(
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, _) {
//                                   switch (value.toInt()) {
//                                     case 0:
//                                       return const Text("Mon");
//                                     case 1:
//                                       return const Text("Tue");
//                                     case 2:
//                                       return const Text("Wed");
//                                     case 3:
//                                       return const Text("Thu");
//                                     case 4:
//                                       return const Text("Fri");
//                                     case 5:
//                                       return const Text("Sat");
//                                     case 6:
//                                       return const Text("Sun");
//                                   }
//                                   return const Text('');
//                                 },
//                               ),
//                             ),
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(showTitles: true),
//                             ),
//                           ),
//                           borderData: FlBorderData(show: false),
//                           barGroups: [
//                             BarChartGroupData(
//                               x: 0,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: 6,
//                                   color: Colors.teal,
//                                   width: 20,
//                                 ),
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: 1,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: 8,
//                                   color: Colors.teal,
//                                   width: 20,
//                                 ),
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: 2,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: 5,
//                                   color: Colors.teal,
//                                   width: 20,
//                                 ),
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: 3,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: 7,
//                                   color: Colors.teal,
//                                   width: 20,
//                                 ),
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: 4,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: 3,
//                                   color: Colors.teal,
//                                   width: 20,
//                                 ),
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: 5,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: 9,
//                                   color: Colors.teal,
//                                   width: 20,
//                                 ),
//                               ],
//                             ),
//                             BarChartGroupData(
//                               x: 6,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: 4,
//                                   color: Colors.teal,
//                                   width: 20,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20), // Spacing between charts
//                     // Candlestick Chart
//                     _buildChartContainer(
//                       context,
//                       CandlestickChart(
//                         // Assuming CandlestickChart is a widget you've created
//                         CandlestickChartData(
//                           candlestickSpots: [
//                             CandlestickSpot(
//                               x: 0,
//                               high: 8.5,
//                               low: 3.2,
//                               open: 4.1,
//                               close: 7.8,
//                             ),
//                             CandlestickSpot(
//                               x: 1,
//                               high: 9.1,
//                               low: 6.5,
//                               open: 7.8,
//                               close: 8.9,
//                             ),
//                             CandlestickSpot(
//                               x: 2,
//                               high: 9.5,
//                               low: 5.8,
//                               open: 8.9,
//                               close: 6.2,
//                             ),
//                             CandlestickSpot(
//                               x: 3,
//                               high: 7.9,
//                               low: 4.1,
//                               open: 6.2,
//                               close: 7.5,
//                             ),
//                             CandlestickSpot(
//                               x: 4,
//                               high: 8.8,
//                               low: 6.9,
//                               open: 7.5,
//                               close: 8.3,
//                             ),
//                             CandlestickSpot(
//                               x: 5,
//                               high: 9.7,
//                               low: 7.2,
//                               open: 8.3,
//                               close: 9.1,
//                             ),
//                             CandlestickSpot(
//                               x: 6,
//                               high: 9.9,
//                               low: 6.1,
//                               open: 9.1,
//                               close: 6.8,
//                             ),
//                           ],
//                           maxY: 10,
//                           minY: 0,
//                           titlesData: FlTitlesData(
//                             show: true,
//                             rightTitles: AxisTitles(
//                               sideTitles: SideTitles(showTitles: false),
//                             ),
//                             topTitles: AxisTitles(
//                               sideTitles: SideTitles(showTitles: false),
//                             ),
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 reservedSize: 40,
//                                 getTitlesWidget: (value, meta) {
//                                   return Text(
//                                     '\$${value.toStringAsFixed(0)}',
//                                     style: const TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 reservedSize: 30,
//                                 getTitlesWidget: (value, meta) {
//                                   final labels = [
//                                     'Mon',
//                                     'Tue',
//                                     'Wed',
//                                     'Thu',
//                                     'Fri',
//                                     'Sat',
//                                     'Sun',
//                                   ];
//                                   if (value.toInt() < labels.length) {
//                                     return Text(
//                                       labels[value.toInt()],
//                                       style: const TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     );
//                                   }
//                                   return const Text('');
//                                 },
//                               ),
//                             ),
//                           ),
//                           gridData: FlGridData(
//                             show: true,
//                             drawVerticalLine: true,
//                             drawHorizontalLine: true,
//                             horizontalInterval: 1,
//                             verticalInterval: 1,
//                             getDrawingHorizontalLine: (value) {
//                               return FlLine(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 strokeWidth: 0.5,
//                               );
//                             },
//                             getDrawingVerticalLine: (value) {
//                               return FlLine(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 strokeWidth: 0.5,
//                               );
//                             },
//                           ),
//                           borderData: FlBorderData(
//                             show: true,
//                             border: Border.all(
//                               color: Colors.grey.withOpacity(0.5),
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 32), // Spacing between charts and activity
//             // Recent Activity
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Recent Activity',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     ...List.generate(
//                       5,
//                       (index) => buildActivityItem(
//                         'Order #${1000 + index}',
//                         'New order received from customer',
//                         '${index + 1}h ago',
//                         Icons.shopping_bag,
//                         context,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       } else {
//         // For larger screens, display charts and activity side-by-side
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Chart Section
//             Expanded(
//               flex: 2,
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Sales Overview',
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       // Line Chart
//                       _buildChartContainer(
//                         context,
//                         LineChart(
//                           LineChartData(
//                             minX: 0,
//                             maxX: 6,
//                             minY: 0,
//                             maxY: 10,
//                             gridData: FlGridData(show: true),
//                             titlesData: FlTitlesData(
//                               bottomTitles: AxisTitles(
//                                 sideTitles: SideTitles(
//                                   showTitles: true,
//                                   getTitlesWidget: (value, _) {
//                                     switch (value.toInt()) {
//                                       case 0:
//                                         return const Text('Mon');
//                                       case 1:
//                                         return const Text('Tue');
//                                       case 2:
//                                         return const Text('Wed');
//                                       case 3:
//                                         return const Text('Thu');
//                                       case 4:
//                                         return const Text('Fri');
//                                       case 5:
//                                         return const Text('Sat');
//                                       case 6:
//                                         return const Text('Sun');
//                                     }
//                                     return const Text('');
//                                   },
//                                   reservedSize: 32,
//                                 ),
//                               ),
//                               leftTitles: AxisTitles(
//                                 sideTitles: SideTitles(
//                                   showTitles: true,
//                                   reservedSize: 32,
//                                 ),
//                               ),
//                             ),
//                             borderData: FlBorderData(show: true),
//                             lineBarsData: [
//                               LineChartBarData(
//                                 spots: const [
//                                   FlSpot(0, 3),
//                                   FlSpot(1, 4),
//                                   FlSpot(2, 7),
//                                   FlSpot(3, 6),
//                                   FlSpot(4, 8),
//                                   FlSpot(5, 5),
//                                   FlSpot(6, 9),
//                                 ],
//                                 isCurved: true,
//                                 color: Colors.teal,
//                                 barWidth: 4,
//                                 dotData: FlDotData(show: true),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20), // Spacing between charts
//                       // Bar Chart
//                       _buildChartContainer(
//                         context,
//                         BarChart(
//                           BarChartData(
//                             alignment: BarChartAlignment.spaceAround,
//                             maxY: 10,
//                             minY: 0,
//                             barTouchData: BarTouchData(
//                               enabled: true,
//                               touchTooltipData: BarTouchTooltipData(
//                                 getTooltipItem:
//                                     (group, groupIndex, rod, rodIndex) {
//                                       return BarTooltipItem(
//                                         '${rod.toY}',
//                                         const TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       );
//                                     },
//                               ),
//                             ),
//                             titlesData: FlTitlesData(
//                               bottomTitles: AxisTitles(
//                                 sideTitles: SideTitles(
//                                   showTitles: true,
//                                   getTitlesWidget: (value, _) {
//                                     switch (value.toInt()) {
//                                       case 0:
//                                         return const Text("Mon");
//                                       case 1:
//                                         return const Text("Tue");
//                                       case 2:
//                                         return const Text("Wed");
//                                       case 3:
//                                         return const Text("Thu");
//                                       case 4:
//                                         return const Text("Fri");
//                                       case 5:
//                                         return const Text("Sat");
//                                       case 6:
//                                         return const Text("Sun");
//                                     }
//                                     return const Text('');
//                                   },
//                                 ),
//                               ),
//                               leftTitles: AxisTitles(
//                                 sideTitles: SideTitles(showTitles: true),
//                               ),
//                             ),
//                             borderData: FlBorderData(show: false),
//                             barGroups: [
//                               BarChartGroupData(
//                                 x: 0,
//                                 barRods: [
//                                   BarChartRodData(
//                                     toY: 6,
//                                     color: Colors.teal,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                               BarChartGroupData(
//                                 x: 1,
//                                 barRods: [
//                                   BarChartRodData(
//                                     toY: 8,
//                                     color: Colors.teal,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                               BarChartGroupData(
//                                 x: 2,
//                                 barRods: [
//                                   BarChartRodData(
//                                     toY: 5,
//                                     color: Colors.teal,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                               BarChartGroupData(
//                                 x: 3,
//                                 barRods: [
//                                   BarChartRodData(
//                                     toY: 7,
//                                     color: Colors.teal,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                               BarChartGroupData(
//                                 x: 4,
//                                 barRods: [
//                                   BarChartRodData(
//                                     toY: 3,
//                                     color: Colors.teal,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                               BarChartGroupData(
//                                 x: 5,
//                                 barRods: [
//                                   BarChartRodData(
//                                     toY: 9,
//                                     color: Colors.teal,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                               BarChartGroupData(
//                                 x: 6,
//                                 barRods: [
//                                   BarChartRodData(
//                                     toY: 4,
//                                     color: Colors.teal,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20), // Spacing between charts
//                       // Candlestick Chart
//                       _buildChartContainer(
//                         context,
//                         CandlestickChart(
//                           // Assuming CandlestickChart is a widget you've created
//                           CandlestickChartData(
//                             candlestickSpots: [
//                               CandlestickSpot(
//                                 x: 0,
//                                 high: 8.5,
//                                 low: 3.2,
//                                 open: 4.1,
//                                 close: 7.8,
//                               ),
//                               CandlestickSpot(
//                                 x: 1,
//                                 high: 9.1,
//                                 low: 6.5,
//                                 open: 7.8,
//                                 close: 8.9,
//                               ),
//                               CandlestickSpot(
//                                 x: 2,
//                                 high: 9.5,
//                                 low: 5.8,
//                                 open: 8.9,
//                                 close: 6.2,
//                               ),
//                               CandlestickSpot(
//                                 x: 3,
//                                 high: 7.9,
//                                 low: 4.1,
//                                 open: 6.2,
//                                 close: 7.5,
//                               ),
//                               CandlestickSpot(
//                                 x: 4,
//                                 high: 8.8,
//                                 low: 6.9,
//                                 open: 7.5,
//                                 close: 8.3,
//                               ),
//                               CandlestickSpot(
//                                 x: 5,
//                                 high: 9.7,
//                                 low: 7.2,
//                                 open: 8.3,
//                                 close: 9.1,
//                               ),
//                               CandlestickSpot(
//                                 x: 6,
//                                 high: 9.9,
//                                 low: 6.1,
//                                 open: 9.1,
//                                 close: 6.8,
//                               ),
//                             ],
//                             maxY: 10,
//                             minY: 0,
                            
//                             titlesData: FlTitlesData(
//                               show: true,
//                               rightTitles: AxisTitles(
//                                 sideTitles: SideTitles(showTitles: false),
//                               ),
//                               topTitles: AxisTitles(
//                                 sideTitles: SideTitles(showTitles: false),
//                               ),
//                               leftTitles: AxisTitles(
//                                 sideTitles: SideTitles(
//                                   showTitles: true,
//                                   reservedSize: 40,
//                                   getTitlesWidget: (value, meta) {
//                                     return Text(
//                                       '\$${value.toStringAsFixed(0)}',
//                                       style: const TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               bottomTitles: AxisTitles(
//                                 sideTitles: SideTitles(
//                                   showTitles: true,
//                                   reservedSize: 30,
//                                   getTitlesWidget: (value, meta) {
//                                     final labels = [
//                                       'Mon',
//                                       'Tue',
//                                       'Wed',
//                                       'Thu',
//                                       'Fri',
//                                       'Sat',
//                                       'Sun',
//                                     ];
//                                     if (value.toInt() < labels.length) {
//                                       return Text(
//                                         labels[value.toInt()],
//                                         style: const TextStyle(
//                                           color: Colors.grey,
//                                           fontSize: 12,
//                                         ),
//                                       );
//                                     }
//                                     return const Text('');
//                                   },
//                                 ),
//                               ),
//                             ),
//                             gridData: FlGridData(
//                               show: true,
//                               drawVerticalLine: true,
//                               drawHorizontalLine: true,
//                               horizontalInterval: 1,
//                               verticalInterval: 1,
//                               getDrawingHorizontalLine: (value) {
//                                 return FlLine(
//                                   color: Colors.grey.withOpacity(0.3),
//                                   strokeWidth: 0.5,
//                                 );
//                               },
//                               getDrawingVerticalLine: (value) {
//                                 return FlLine(
//                                   color: Colors.grey.withOpacity(0.3),
//                                   strokeWidth: 0.5,
//                                 );
//                               },
//                             ),
//                             borderData: FlBorderData(
//                               show: true,
//                               border: Border.all(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20),

//             // Recent Activity
//             Expanded(
//               flex: 1,
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Recent Activity',
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       ...List.generate(
//                         5,
//                         (index) => buildActivityItem(
//                           'Order #${1000 + index}',
//                           'New order received from customer',
//                           '${index + 1}h ago',
//                           Icons.shopping_bag,
//                           context,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       }
//     },
//   );
// }

// // Helper for chart containers to reuse styling
// Widget _buildChartContainer(BuildContext context, Widget chartWidget) {
//   return Container(
//     height: 300,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Center(child: chartWidget),
//   );
// }
