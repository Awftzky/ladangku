import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ladangku/app/common/theme/app_colors.dart';
import 'package:ladangku/app/common/widget/button/primary_button.dart';
import 'package:ladangku/app/common/widget/card/rolepicker_card.dart';
import 'package:ladangku/app/common/widget/scaffold/app_scaffold.dart';
import 'package:ladangku/app/modules/authentication/rolepicker/controllers/rolepicker_controller.dart';


class RolePickerView extends GetView<RolePickerController> {
  const RolePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    return AppScaffold(
      backgroundColor: AppColors.white,
      safeAreaTop: true,
      safeAreaBottom: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          children: [
            SizedBox(height: height * 0.05),

            // --- HEADER LOGO ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/logo.png', width: width * 0.12),
                const SizedBox(width: 8),
                Text(
                  'Ladangku',
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Text(
              'Tumbuh Bersama Petani Digital',
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: height * 0.08),

            // --- TITLE ---
            Text.rich(
              TextSpan(
                text: 'Pilih Peranmu di ',
                children: [
                  TextSpan(
                    text: 'Ladangku',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
                color: AppColors.lightOnSurface,
              ),
            ),

            SizedBox(height: height * 0.04),

            // --- CARDS ---
            Obx(() => Column(
              children: [
                RolePickerCard(
                  title: 'Farmer (Petani)',
                  description: 'Catat panenmu dan jual hasilnya secara digital.',
                  value: 'farmer',
                  groupValue: controller.selectedRole.value,
                  onTap: () => controller.selectRole('farmer'),
                ),
                SizedBox(height: height * 0.02),
                RolePickerCard(
                  title: 'Consumer (Pembeli)',
                  description: 'Beli hasil panen terpercaya langsung dari petani.',
                  value: 'consumer',
                  groupValue: controller.selectedRole.value,
                  onTap: () => controller.selectRole('consumer'),
                ),
              ],
            )),

            SizedBox(height: height * 0.02),
            // --- BUTTON BUAT AKUN ---
            // --- BUTTON BUAT AKUN ---
            Obx(() {
              final isActive = controller.isButtonActive;
              return PrimaryButton(
                text: 'Buat Akun',

                onPressed: isActive ? controller.goToRegister : null,
                backgroundColor: isActive ? AppColors.primary : AppColors.lightOutline.withValues(alpha: 0.3),
                textColor: isActive ? AppColors.white : AppColors.lightOutline,
              );
            }),

            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}