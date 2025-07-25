// import 'package:flutter/material.dart';
// import 'package:web_site/widgets/analytics_content.dart';
// import 'package:web_site/widgets/dashboard_widget.dart';

// void main() {
//   runApp(const MyWebDashboardApp());
// }

// class MyWebDashboardApp extends StatefulWidget {
//   const MyWebDashboardApp({super.key});

//   @override
//   State<MyWebDashboardApp> createState() => _MyWebDashboardAppState();
// }

// class _MyWebDashboardAppState extends State<MyWebDashboardApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dashboard',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF6366F1),
//           brightness: Brightness.light,
//         ),
//         useMaterial3: true,
//         cardTheme: CardThemeData(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//       darkTheme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF6366F1),
//           brightness: Brightness.dark,
//         ),
//         useMaterial3: true,
//         cardTheme: CardThemeData(
//           elevation: 2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//       home: const DashboardPage(),
//     );
//   }
// }

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   int selectedIndex = 0;
//   bool isDarkMode = false;

//   final List<String> pageNames = [
//     'Dashboard',
//     'Analytics',
//     'Users',
//     'Products',
//     'Settings',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Container(
//             width: 280,
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.surface,
//               border: Border(
//                 right: BorderSide(
//                   color: Theme.of(context).dividerColor.withOpacity(0.1),
//                   width: 1,
//                 ),
//               ),
//             ),
//             child: Column(
//               children: [
//                 // Logo/Brand Section
//                 Container(
//                   padding: const EdgeInsets.all(24),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.primary,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Icon(
//                           Icons.dashboard_customize,
//                           color: Theme.of(context).colorScheme.onPrimary,
//                           size: 24,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Text(
//                         'Dashboard Pro',
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Navigation Menu
//                 Expanded(
//                   child: ListView(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     children: [
//                       _buildNavItem(
//                         0,
//                         Icons.dashboard_outlined,
//                         Icons.dashboard,
//                         'Dashboard',
//                       ),
//                       _buildNavItem(
//                         1,
//                         Icons.analytics_outlined,
//                         Icons.analytics,
//                         'Analytics',
//                       ),
//                       _buildNavItem(
//                         2,
//                         Icons.people_outline,
//                         Icons.people,
//                         'Users',
//                       ),
//                       _buildNavItem(
//                         3,
//                         Icons.inventory_2_outlined,
//                         Icons.inventory_2,
//                         'Products',
//                       ),
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         child: Text(
//                           'SETTINGS',
//                           style: Theme.of(context).textTheme.labelSmall
//                               ?.copyWith(
//                                 color: Theme.of(
//                                   context,
//                                 ).colorScheme.onSurface.withOpacity(0.6),
//                                 fontWeight: FontWeight.w600,
//                                 letterSpacing: 1.2,
//                               ),
//                         ),
//                       ),
//                       _buildNavItem(
//                         4,
//                         Icons.settings_outlined,
//                         Icons.settings,
//                         'Settings',
//                       ),
//                       _buildNavItem(
//                         -1,
//                         Icons.logout_outlined,
//                         Icons.logout,
//                         'Logout',
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Theme Toggle
//                 Container(
//                   margin: const EdgeInsets.all(16),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Theme.of(
//                       context,
//                     ).colorScheme.surfaceVariant.withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         isDarkMode ? Icons.dark_mode : Icons.light_mode,
//                         size: 20,
//                         color: Theme.of(context).colorScheme.onSurfaceVariant,
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           isDarkMode ? 'Dark Mode' : 'Light Mode',
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ),
//                       Switch(
//                         value: isDarkMode,
//                         onChanged: (value) {
//                           setState(() {
//                             isDarkMode = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Main content
//           Expanded(
//             child: Column(
//               children: [
//                 // Enhanced AppBar
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 32,
//                     vertical: 20,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.surface,
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Theme.of(context).dividerColor.withOpacity(0.1),
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               pageNames[selectedIndex],
//                               style: Theme.of(context).textTheme.headlineSmall
//                                   ?.copyWith(fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'Welcome back! Here\'s what\'s happening with your business today.',
//                               style: Theme.of(context).textTheme.bodyMedium
//                                   ?.copyWith(
//                                     color: Theme.of(
//                                       context,
//                                     ).colorScheme.onSurface.withOpacity(0.7),
//                                   ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Search Bar
//                       Container(
//                         width: 300,
//                         margin: const EdgeInsets.only(right: 16),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Search...',
//                             prefixIcon: const Icon(Icons.search),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide.none,
//                             ),
//                             filled: true,
//                             fillColor: Theme.of(
//                               context,
//                             ).colorScheme.surfaceVariant.withOpacity(0.5),
//                           ),
//                         ),
//                       ),

//                       // Notifications
//                       IconButton(
//                         onPressed: () {},
//                         icon: Badge(
//                           label: const Text('3'),
//                           child: Icon(
//                             Icons.notifications_outlined,
//                             color: Theme.of(
//                               context,
//                             ).colorScheme.onSurface.withOpacity(0.7),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 16),

//                       // Profile
//                       PopupMenuButton<String>(
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CircleAvatar(
//                               radius: 18,
//                               backgroundColor: Theme.of(
//                                 context,
//                               ).colorScheme.primary,
//                               child: Text(
//                                 'JD',
//                                 style: TextStyle(
//                                   color: Theme.of(
//                                     context,
//                                   ).colorScheme.onPrimary,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   'Mahek Patel',
//                                   style: Theme.of(context).textTheme.bodyMedium
//                                       ?.copyWith(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   'Admin',
//                                   style: Theme.of(context).textTheme.bodySmall
//                                       ?.copyWith(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onSurface
//                                             .withOpacity(0.6),
//                                       ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(width: 8),
//                             Icon(
//                               Icons.keyboard_arrow_down,
//                               color: Theme.of(
//                                 context,
//                               ).colorScheme.onSurface.withOpacity(0.7),
//                             ),
//                           ],
//                         ),
//                         itemBuilder: (context) => [
//                           PopupMenuItem<String>(
//                             value: 'profile',
//                             child: const ListTile(
//                               leading: Icon(Icons.person_outline),
//                               title: Text('Profile'),
//                               contentPadding: EdgeInsets.zero,
//                             ),
//                           ),
//                           PopupMenuItem<String>(
//                             value: 'settings',
//                             child: const ListTile(
//                               leading: Icon(Icons.settings_outlined),
//                               title: Text('Settings'),
//                               contentPadding: EdgeInsets.zero,
//                             ),
//                           ),
//                           const PopupMenuDivider(),
//                           PopupMenuItem<String>(
//                             value: 'logout',
//                             child: const ListTile(
//                               leading: Icon(Icons.logout),
//                               title: Text('Logout'),
//                               contentPadding: EdgeInsets.zero,
//                             ),
//                           ),
//                         ],
//                         onSelected: (String value) {
//                           switch (value) {
//                             case 'profile':
//                               // Handle profile action
//                               break;
//                             case 'settings':
//                               // Handle settings action
//                               setState(() {
//                                 selectedIndex = 4; // Navigate to settings
//                               });
//                               break;
//                             case 'logout':
//                               // Handle logout action
//                               break;
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Body content
//                 Expanded(child: _buildPageContent()),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(
//     int index,
//     IconData icon,
//     IconData selectedIcon,
//     String label,
//   ) {
//     final isSelected = selectedIndex == index;

//     return Container(
//       margin: const EdgeInsets.only(bottom: 4),
//       child: ListTile(
//         leading: Icon(
//           isSelected ? selectedIcon : icon,
//           color: isSelected
//               ? Theme.of(context).colorScheme.primary
//               : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
//         ),
//         title: Text(
//           label,
//           style: TextStyle(
//             color: isSelected
//                 ? Theme.of(context).colorScheme.primary
//                 : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
//             fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//           ),
//         ),
//         selected: isSelected,
//         selectedTileColor: Theme.of(
//           context,
//         ).colorScheme.primary.withOpacity(0.1),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         onTap: () {
//           if (index >= 0) {
//             setState(() {
//               selectedIndex = index;
//             });
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildPageContent() {
//     switch (selectedIndex) {
//       case 0:
//         return buildDashboardContent(context);
//       case 1:
//         return buildAnalyticsContent();
//       case 2:
//         return _buildUsersContent();
//       case 3:
//         return _buildProductsConftent();
//       case 4:
//         return _buildSettingsContent();
//       default:
//         return buildDashboardContent(context);
//     }
//   }

//   Widget _buildUsersContent() {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.people, size: 64, color: Colors.grey),
//           SizedBox(height: 16),
//           Text('Users Page', style: TextStyle(fontSize: 24)),
//           Text('User management and details will be shown here'),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductsContent() {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.inventory_2, size: 64, color: Colors.grey),
//           SizedBox(height: 16),
//           Text('Products Page', style: TextStyle(fontSize: 24)),
//           Text('Product catalog and inventory will be shown here'),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsContent() {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.settings, size: 64, color: Colors.grey),
//           SizedBox(height: 16),
//           Text('Settings Page', style: TextStyle(fontSize: 24)),
//           Text('Application settings and preferences will be shown here'),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_site/views/analytics_screen.dart';
import 'package:web_site/views/dashboard_screen.dart';
import 'package:web_site/views/product_page.dart';
import 'package:web_site/views/settings_page.dart';
import 'package:web_site/views/user_page.dart';

void main() {
  runApp(const MyWebDashboardApp());
}

class MyWebDashboardApp extends StatefulWidget {
  const MyWebDashboardApp({super.key});

  @override
  State<MyWebDashboardApp> createState() => _MyWebDashboardAppState();
}

class _MyWebDashboardAppState extends State<MyWebDashboardApp> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: DashboardPage(isDarkMode: isDarkMode, onThemeToggle: toggleTheme),
    );
  }
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1024;

class DashboardPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;
  const DashboardPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  // bool isDarkMode = false;

  final List<String> pageNames = [
    'Dashboard',
    'Analytics',
    'Users',
    'Products',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isMobile(context) ? Drawer(child: _buildSidebar()) : null,
      body: Row(
        children: [
          if (!isMobile(context)) SizedBox(width: 280, child: _buildSidebar()),
          Expanded(
            child: Column(
              children: [
                _buildAppBar(context),
                Expanded(child: _buildPageContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.dashboard_customize,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Dashboard Pro',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildNavItem(
                  0,
                  Icons.dashboard_outlined,
                  Icons.dashboard,
                  'Dashboard',
                ),
                _buildNavItem(
                  1,
                  Icons.analytics_outlined,
                  Icons.analytics,
                  'Analytics',
                ),
                _buildNavItem(2, Icons.people_outline, Icons.people, 'Users'),
                _buildNavItem(
                  3,
                  Icons.inventory_2_outlined,
                  Icons.inventory_2,
                  'Products',
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    'SETTINGS',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                _buildNavItem(
                  4,
                  Icons.settings_outlined,
                  Icons.settings,
                  'Settings',
                ),
                _buildNavItem(
                  -1,
                  Icons.logout_outlined,
                  Icons.logout,
                  'Logout',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceVariant.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.isDarkMode ? 'Dark Mode' : 'Light Mode',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Switch(
                  value: widget.isDarkMode,
                  onChanged: widget.onThemeToggle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (isMobile(context))
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageNames[selectedIndex],
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Welcome back! Here\'s what\'s happening today.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    IconData selectedIcon,
    String label,
  ) {
    final isSelected = selectedIndex == index;
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading: Icon(
          isSelected ? selectedIcon : icon,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedTileColor: Theme.of(
          context,
        ).colorScheme.primary.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          if (index >= 0) {
            setState(() {
              selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildPageContent() {
    switch (selectedIndex) {
      case 0:
        return DashboardScreen();
      case 1:
        return AnalyticsScreen();
      case 2:
        return UserPage();
      case 3:
        return ProductsPage();
      case 4:
        return SettingsPage();
      default:
        return DashboardScreen();
    }
  }
}
