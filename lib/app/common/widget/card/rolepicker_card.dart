import 'package:flutter/material.dart';
import 'package:ladangku/app/common/theme/app_colors.dart';

class RolePickerCard extends StatelessWidget {
  final String title;
  final String description;
  final String value;
  final String groupValue;
  final VoidCallback onTap;

  const RolePickerCard({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isActive = value == groupValue;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(width * 0.05),
        decoration: BoxDecoration(
          // Kalau active, kasih warna background hijau super tipis
          color: isActive
              ? AppColors.primary.withValues(alpha: 0.05)
              : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            // Kalau active garisnya hijau tebal, kalau inactive abu-abu tipis
            color: isActive
                ? AppColors.primary
                : AppColors.lightOutline.withValues(alpha: 0.5),
            width: isActive ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: AppColors.lightOnSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: width * 0.035,
                color: AppColors.lightOnSurface.withValues(alpha: 0.8),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}