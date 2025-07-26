import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  double _volumeLevel = 0.7;
  String _selectedLanguage = 'English';
  String _selectedTheme = 'System';

  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
  ];
  final List<String> _themes = ['Light', 'Dark', 'System'];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
        );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              bool isDesktop = maxWidth >= 1000;
              bool isTablet = maxWidth >= 600 && maxWidth < 1000;
              bool isMobile = maxWidth < 600;

              double cardWidth = isDesktop
                  ? 700
                  : isTablet
                  ? 550
                  : double.infinity;

              EdgeInsets padding = EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: isMobile ? 8 : 16,
              );

              return Container(
                width: cardWidth,
                padding: padding,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    // Profile Header
                    SliverToBoxAdapter(child: _buildProfileHeader(colorScheme)),

                    // Account Section
                    SliverToBoxAdapter(
                      child: _buildAnimatedSection(
                        "Account",
                        Icons.account_circle,
                        colorScheme,
                        [
                          _buildAdvancedSettingTile(
                            icon: Icons.person,
                            title: "Edit Profile",
                            subtitle: "Change your name, photo, bio",
                            onTap: () => _showProfileDialog(),
                            badge: "New",
                            iconColor: Colors.blue,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.email,
                            title: "Email",
                            subtitle: "user@example.com",
                            onTap: () => _showEmailDialog(),
                            trailing: const Icon(
                              Icons.verified,
                              color: Colors.green,
                            ),
                            iconColor: Colors.green,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.lock,
                            title: "Change Password",
                            subtitle: "Last changed 30 days ago",
                            onTap: () => _showPasswordDialog(),
                            iconColor: Colors.orange,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.security,
                            title: "Two-Factor Authentication",
                            subtitle: "Add extra security",
                            onTap: () => _show2FADialog(),
                            iconColor: Colors.purple,
                            colorScheme: colorScheme,
                          ),
                        ],
                      ),
                    ),

                    // Preferences Section
                    SliverToBoxAdapter(
                      child: _buildAnimatedSection(
                        "Preferences",
                        Icons.tune,
                        colorScheme,
                        [
                          _buildSwitchTile(
                            icon: Icons.notifications_active,
                            title: "Push Notifications",
                            subtitle: "Receive app notifications",
                            value: _notificationsEnabled,
                            onChanged: (value) {
                              setState(() {
                                _notificationsEnabled = value;
                              });
                              _showSnackBar(
                                "Notifications ${value ? 'enabled' : 'disabled'}",
                              );
                            },
                            iconColor: Colors.blue,
                            colorScheme: colorScheme,
                          ),
                          _buildSwitchTile(
                            icon: Icons.volume_up,
                            title: "Sound Effects",
                            subtitle: "Play sounds for actions",
                            value: _soundEnabled,
                            onChanged: (value) {
                              setState(() {
                                _soundEnabled = value;
                              });
                              if (value) {
                                HapticFeedback.mediumImpact();
                              }
                            },
                            iconColor: Colors.green,
                            colorScheme: colorScheme,
                          ),
                          _buildSwitchTile(
                            icon: Icons.vibration,
                            title: "Vibration",
                            subtitle: "Haptic feedback",
                            value: _vibrationEnabled,
                            onChanged: (value) {
                              setState(() {
                                _vibrationEnabled = value;
                              });
                              if (value) {
                                HapticFeedback.heavyImpact();
                              }
                            },
                            iconColor: Colors.purple,
                            colorScheme: colorScheme,
                          ),
                          _buildSliderTile(
                            icon: Icons.volume_down,
                            title: "Volume Level",
                            subtitle: "${(_volumeLevel * 100).round()}%",
                            value: _volumeLevel,
                            onChanged: (value) {
                              setState(() {
                                _volumeLevel = value;
                              });
                            },
                            iconColor: Colors.orange,
                            colorScheme: colorScheme,
                          ),
                          _buildDropdownTile(
                            icon: Icons.language,
                            title: "Language",
                            subtitle: _selectedLanguage,
                            items: _languages,
                            onChanged: (value) {
                              setState(() {
                                _selectedLanguage = value!;
                              });
                              _showSnackBar(
                                "Language changed to $_selectedLanguage",
                              );
                            },
                            iconColor: Colors.teal,
                            colorScheme: colorScheme,
                          ),
                          _buildDropdownTile(
                            icon: Icons.palette,
                            title: "Theme",
                            subtitle: _selectedTheme,
                            items: _themes,
                            onChanged: (value) {
                              setState(() {
                                _selectedTheme = value!;
                              });
                              _showSnackBar("Theme changed to $_selectedTheme");
                            },
                            iconColor: Colors.indigo,
                            colorScheme: colorScheme,
                          ),
                        ],
                      ),
                    ),

                    // Privacy & Security Section
                    SliverToBoxAdapter(
                      child: _buildAnimatedSection(
                        "Privacy & Security",
                        Icons.security,
                        colorScheme,
                        [
                          _buildAdvancedSettingTile(
                            icon: Icons.fingerprint,
                            title: "Biometric Lock",
                            subtitle: "Use fingerprint or face ID",
                            onTap: () => _showBiometricDialog(),
                            iconColor: Colors.red,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.visibility_off,
                            title: "Privacy Settings",
                            subtitle: "Control your data visibility",
                            onTap: () => _showPrivacyDialog(),
                            iconColor: Colors.deepPurple,
                            colorScheme: colorScheme,
                          ),
                        ],
                      ),
                    ),

                    // More Section
                    SliverToBoxAdapter(
                      child: _buildAnimatedSection(
                        "More",
                        Icons.more_horiz,
                        colorScheme,
                        [
                          _buildAdvancedSettingTile(
                            icon: Icons.help_outline,
                            title: "Help & Support",
                            subtitle: "FAQs, contact us, tutorials",
                            onTap: () => _showHelpDialog(),
                            iconColor: Colors.blue,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.info_outline,
                            title: "About App",
                            subtitle: "Version 1.0.0",
                            onTap: () => _showAboutDialog(),
                            iconColor: Colors.grey,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.star_rate,
                            title: "Rate App",
                            subtitle: "Share your feedback",
                            onTap: () => _showRatingDialog(),
                            iconColor: Colors.amber,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.privacy_tip_outlined,
                            title: "Privacy Policy",
                            subtitle: "Read our privacy policy",
                            onTap: () => _showPrivacyPolicyDialog(),
                            iconColor: Colors.teal,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.description,
                            title: "Terms of Service",
                            subtitle: "View terms and conditions",
                            onTap: () => _showTermsDialog(),
                            iconColor: Colors.indigo,
                            colorScheme: colorScheme,
                          ),
                          _buildAdvancedSettingTile(
                            icon: Icons.logout,
                            title: "Logout",
                            subtitle: "Sign out from your account",
                            onTap: () => _showLogoutDialog(),
                            iconColor: Colors.red,
                            colorScheme: colorScheme,
                            isDestructive: true,
                          ),
                        ],
                      ),
                    ),

                    // Bottom Spacing
                    const SliverToBoxAdapter(child: SizedBox(height: 40)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.1),
            colorScheme.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Hero(
            tag: 'profile_avatar',
            child: CircleAvatar(
              radius: 30,
              backgroundColor: colorScheme.primary,
              child: Text(
                'JD',
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: colorScheme.onBackground.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Premium User',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _showProfileDialog(),
            icon: Icon(Icons.edit, color: colorScheme.primary),
            tooltip: 'Edit Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedSection(
    String title,
    IconData sectionIcon,
    ColorScheme colorScheme,
    List<Widget> children,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title, sectionIcon, colorScheme),
          ...children,
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    IconData icon,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colorScheme.primary,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color iconColor,
    required ColorScheme colorScheme,
    Widget? trailing,
    String? badge,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            HapticFeedback.lightImpact();
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: isDestructive
                                  ? Colors.red
                                  : colorScheme.onSurface,
                            ),
                          ),
                          if (badge != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                badge,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: colorScheme.onSurface.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing ??
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: colorScheme.onSurface.withOpacity(0.4),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color iconColor,
    required ColorScheme colorScheme,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeColor: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required double value,
    required ValueChanged<double> onChanged,
    required Color iconColor,
    required ColorScheme colorScheme,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: colorScheme.onSurface.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: colorScheme.primary,
                inactiveTrackColor: colorScheme.outline.withOpacity(0.3),
                thumbColor: colorScheme.primary,
                overlayColor: colorScheme.primary.withOpacity(0.2),
              ),
              child: Slider(
                value: value,
                onChanged: onChanged,
                min: 0.0,
                max: 1.0,
                divisions: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required Color iconColor,
    required ColorScheme colorScheme,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: subtitle,
                      isDense: true,
                      onChanged: onChanged,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: colorScheme.onSurface.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Edit Profile'),
        content: Text('Profile editing dialog would be implemented here.'),
      ),
    );
  }

  void _showEmailDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Update Email'),
        content: Text('Email update dialog would be implemented here.'),
      ),
    );
  }

  void _showPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Change Password'),
        content: Text('Password change dialog would be implemented here.'),
      ),
    );
  }

  void _show2FADialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Two-Factor Authentication'),
        content: Text('2FA setup dialog would be implemented here.'),
      ),
    );
  }

  void _showBiometricDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Biometric Lock'),
        content: Text('Biometric setup dialog would be implemented here.'),
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Privacy Settings'),
        content: Text('Privacy settings dialog would be implemented here.'),
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.help_outline, color: Colors.blue),
            SizedBox(width: 8),
            Text('Help & Support'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQ'),
              subtitle: const Text('Frequently asked questions'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar('Opening FAQ section...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_support),
              title: const Text('Contact Support'),
              subtitle: const Text('Get help from our team'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar('Opening contact support...');
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Video Tutorials'),
              subtitle: const Text('Learn how to use the app'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar('Opening video tutorials...');
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Settings App',
      applicationVersion: '1.0.0',
      applicationIcon: const FlutterLogo(size: 40),
      children: [
        const Text(
          'A powerful settings page implementation with advanced features.',
        ),
        const SizedBox(height: 16),
        const Text('Built with Flutter and Material Design 3.'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () => _showSnackBar('Opening website...'),
              icon: const Icon(Icons.web),
              label: const Text('Website'),
            ),
            TextButton.icon(
              onPressed: () => _showSnackBar('Opening GitHub...'),
              icon: const Icon(Icons.code),
              label: const Text('GitHub'),
            ),
          ],
        ),
      ],
    );
  }

  void _showRatingDialog() {
    int selectedRating = 5;
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8),
              Text('Rate Our App'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('How would you rate your experience?'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        selectedRating = index + 1;
                      });
                    },
                    icon: Icon(
                      index < selectedRating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 32,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tell us what you think...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) {
                  // Handle feedback text
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackBar('Thank you for your feedback!');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _showPrivacyPolicyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPolicySection(
                  '1. Information We Collect',
                  'We collect information you provide directly to us, such as when you create an account, use our services, or contact us for support.',
                ),
                _buildPolicySection(
                  '2. How We Use Information',
                  'We use the information we collect to provide, maintain, and improve our services, process transactions, and communicate with you.',
                ),
                _buildPolicySection(
                  '3. Information Sharing',
                  'We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this policy.',
                ),
                _buildPolicySection(
                  '4. Data Security',
                  'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
                ),
                _buildPolicySection(
                  '5. Contact Us',
                  'If you have any questions about this Privacy Policy, please contact us at privacy@example.com.',
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Privacy policy accepted');
            },
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Terms of Service'),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPolicySection(
                  '1. Acceptance of Terms',
                  'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
                ),
                _buildPolicySection(
                  '2. Use License',
                  'Permission is granted to temporarily use this application for personal, non-commercial transitory viewing only.',
                ),
                _buildPolicySection(
                  '3. Disclaimer',
                  'The materials in this application are provided on an \'as is\' basis. We make no warranties, expressed or implied.',
                ),
                _buildPolicySection(
                  '4. Limitations',
                  'In no event shall our company or its suppliers be liable for any damages arising out of the use or inability to use this application.',
                ),
                _buildPolicySection(
                  '5. Modifications',
                  'We may revise these terms of service at any time without notice. By using this application, you are agreeing to be bound by the current version.',
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Decline'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Terms of service accepted');
            },
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicySection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.logout, color: Colors.red),
            SizedBox(width: 8),
            Text('Logout'),
          ],
        ),
        content: const Text(
          'Are you sure you want to logout from your account?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _performLogout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _performLogout() {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('Logging out...'),
          ],
        ),
      ),
    );

    // Simulate logout process
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close loading dialog
      _showSnackBar('Successfully logged out');
      // Navigate to login screen or perform actual logout
    });
  }

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }
}
