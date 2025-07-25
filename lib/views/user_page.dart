// user_page.dart
import 'package:flutter/material.dart';
import 'package:web_site/data/user_data.dart';
import '../widgets/user_card.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(_getPadding(constraints.maxWidth)),
            child: _buildResponsiveLayout(constraints),
          );
        },
      ),
    );
  }

  Widget _buildResponsiveLayout(BoxConstraints constraints) {
    final screenWidth = constraints.maxWidth;

    if (screenWidth < 600) {
      // Mobile Layout
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) =>
            UserCard(user: users[index], layoutType: UserCardLayout.mobile),
      );
    } else if (screenWidth < 1200) {
      // Tablet Layout
      return GridView.builder(
        itemCount: users.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth < 800 ? 1 : 2,
          childAspectRatio: screenWidth < 800 ? 4 : 3.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) =>
            UserCard(user: users[index], layoutType: UserCardLayout.tablet),
      );
    } else {
      // Desktop/Web Layout
      return GridView.builder(
        itemCount: users.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(screenWidth),
          childAspectRatio: 3.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) =>
            UserCard(user: users[index], layoutType: UserCardLayout.desktop),
      );
    }
  }

  int _getCrossAxisCount(double width) {
    if (width > 1600) return 4;
    if (width > 1200) return 3;
    return 2;
  }

  double _getPadding(double width) {
    if (width < 600) return 12;
    if (width < 1200) return 16;
    return 24;
  }
}
