import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;
          bool isDesktop = maxWidth >= 1000;
          bool isTablet = maxWidth >= 600 && maxWidth < 1000;

          double cardWidth = isDesktop
              ? 600
              : isTablet
              ? 500
              : double.infinity;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: cardWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListView(
                children: [
                  _buildSectionTitle("Account"),
                  _buildSettingTile(
                    icon: Icons.person,
                    title: "Edit Profile",
                    subtitle: "Change your name, photo",
                  ),
                  _buildSettingTile(
                    icon: Icons.email,
                    title: "Email",
                    subtitle: "Update your email address",
                  ),
                  _buildSettingTile(
                    icon: Icons.lock,
                    title: "Change Password",
                    subtitle: "Update your password",
                  ),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Preferences"),
                  _buildSettingTile(
                    icon: Icons.notifications_active,
                    title: "Notifications",
                    subtitle: "Push, Email, SMS",
                  ),
                  _buildSettingTile(
                    icon: Icons.language,
                    title: "Language",
                    subtitle: "Choose app language",
                  ),
                  const SizedBox(height: 30),
                  _buildSectionTitle("More"),
                  _buildSettingTile(
                    icon: Icons.help_outline,
                    title: "Help & Support",
                    subtitle: "FAQs and support",
                  ),
                  _buildSettingTile(
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy Policy",
                    subtitle: "View our policy",
                  ),
                  _buildSettingTile(
                    icon: Icons.logout,
                    title: "Logout",
                    subtitle: "Sign out from your account",
                    iconColor: Colors.red,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Color iconColor = Colors.blueAccent,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // handle onTap
        },
      ),
    );
  }
}
