// import 'package:flutter/material.dart';

// Widget buildStatCard(
//     String title,
//     String value,
//     IconData icon,
//     Color color,
//     String change,
//     BuildContext context,
//     ) {
//     return Card(
//         child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                             Icon(icon, color: color, size: 24),
//                             Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                 decoration: BoxDecoration(
//                                     color: color.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Text(
//                                     change,
//                                     style: TextStyle(
//                                         color: color,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600,
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                         value,
//                         style: Theme.of(
//                             context,
//                         ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                         title,
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
//                         ),
//                     ),
//                 ],
//             ),
//         ),
//     );
// }

// Widget buildActivityItem(
//     String title,
//     String description,
//     String time,
//     IconData icon,
//     BuildContext context,
//     ) {
//     return Padding(
//         padding: const EdgeInsets.only(bottom: 16),
//         child: Row(
//             children: [
//                 Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Icon(
//                         icon,
//                         size: 20,
//                         color: Theme.of(context).colorScheme.primary,
//                     ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                             Text(
//                                 title,
//                                 style: Theme.of(
//                                     context,
//                                 ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                             Text(
//                                 description,
//                                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                                     color: Theme.of(
//                                         context,
//                                     ).colorScheme.onSurface.withOpacity(0.7),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//                 Text(
//                     time,
//                     style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                         color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
//                     ),
//                 ),
//             ],
//         ),
//     );
// }