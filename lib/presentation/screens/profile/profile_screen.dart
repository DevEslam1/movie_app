import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.surface,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withValues(alpha: 0.2),
                      AppColors.surface,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.surfaceContainerHigh,
                        child:
                            Icon(Icons.person, size: 60, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.m),
                    Text(
                      'Eslam Mahmoud',
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        'PREMIUM MEMBER',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppDimensions.m),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Stats Row
                Row(
                  children: [
                    _buildStatItem('42', 'Watched'),
                    _buildStatItem('15', 'Watchlist'),
                    _buildStatItem('8', 'Reviews'),
                  ],
                ),

                const SizedBox(height: AppDimensions.xl),

                Text(
                  'Account Settings',
                  style: AppTextStyles.titleMedium
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppDimensions.m),
                _buildSettingsTile(Icons.person_outline, 'Personal Information',
                    'Email, Password, Name'),
                _buildSettingsTile(Icons.notifications_none, 'Notifications',
                    'Alerts, Emails, News'),
                _buildSettingsTile(Icons.download_for_offline_outlined,
                    'Downloads', 'Quality, Storage, Auto-delete'),

                const SizedBox(height: AppDimensions.xl),

                Text(
                  'App Preferences',
                  style: AppTextStyles.titleMedium
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppDimensions.m),
                _buildSettingsTile(
                    Icons.language_outlined, 'Language', 'English (Default)'),
                _buildSettingsTile(Icons.privacy_tip_outlined,
                    'Privacy & Safety', 'Sharing, Data, Visibility'),
                _buildSettingsTile(Icons.help_outline, 'Help & Support',
                    'FAQ, Feedback, Contact Us'),

                const SizedBox(height: AppDimensions.xxl),

                // Logout Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent, width: 1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusM),
                      ),
                    ),
                    child: const Text('Sign Out',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),

                // Bottom spacing for glass nav
                const SizedBox(height: 120),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String val, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          border:
              Border.all(color: AppColors.onSurface.withValues(alpha: 0.05)),
        ),
        child: Column(
          children: [
            Text(val,
                style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label,
                style: AppTextStyles.bodySmall.copyWith(color: Colors.white60)),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 22),
        title: Text(title,
            style:
                AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle,
            style: AppTextStyles.bodySmall.copyWith(color: Colors.white54)),
        trailing:
            const Icon(Icons.chevron_right, size: 20, color: Colors.white30),
        onTap: () {},
      ),
    );
  }
}
