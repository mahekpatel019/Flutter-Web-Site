import 'package:flutter/material.dart';
import '../models/user_model.dart';

enum UserCardLayout { mobile, tablet, desktop }

class UserCard extends StatefulWidget {
  final UserModel user;
  final UserCardLayout layoutType;

  const UserCard({
    super.key,
    required this.user,
    this.layoutType = UserCardLayout.mobile,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: _buildCard(),
          );
        },
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  Widget _buildCard() {
    return Card(
      elevation: _isHovered ? 12 : 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius()),
      ),
      shadowColor: Colors.deepPurple.withOpacity(_isHovered ? 0.4 : 0.3),
      margin: EdgeInsets.symmetric(
        horizontal: _getHorizontalMargin(),
        vertical: _getVerticalMargin(),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isHovered
                ? [const Color(0xFF7B6AE6), const Color(0xFFA47EE1)]
                : [const Color(0xFF6A5AE0), const Color(0xFF9370DB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        ),
        padding: EdgeInsets.all(_getPadding()),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    switch (widget.layoutType) {
      case UserCardLayout.mobile:
        return _buildMobileLayout();
      case UserCardLayout.tablet:
        return _buildTabletLayout();
      case UserCardLayout.desktop:
        return _buildDesktopLayout();
    }
  }

  Widget _buildMobileLayout() {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Text(
            widget.user.name[0].toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFF6A5AE0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                widget.user.email,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white70,
          size: 16,
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: Text(
            widget.user.name[0].toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF6A5AE0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                widget.user.email,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white70,
          size: 18,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: Text(
            widget.user.name[0].toUpperCase(),
            style: const TextStyle(
              fontSize: 28,
              color: Color(0xFF6A5AE0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                widget.user.email,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }

  double _getBorderRadius() {
    switch (widget.layoutType) {
      case UserCardLayout.mobile:
        return 12;
      case UserCardLayout.tablet:
        return 16;
      case UserCardLayout.desktop:
        return 20;
    }
  }

  double _getPadding() {
    switch (widget.layoutType) {
      case UserCardLayout.mobile:
        return 12;
      case UserCardLayout.tablet:
        return 16;
      case UserCardLayout.desktop:
        return 20;
    }
  }

  double _getHorizontalMargin() {
    switch (widget.layoutType) {
      case UserCardLayout.mobile:
        return 8;
      case UserCardLayout.tablet:
        return 0;
      case UserCardLayout.desktop:
        return 0;
    }
  }

  double _getVerticalMargin() {
    switch (widget.layoutType) {
      case UserCardLayout.mobile:
        return 6;
      case UserCardLayout.tablet:
        return 0;
      case UserCardLayout.desktop:
        return 0;
    }
  }
}
