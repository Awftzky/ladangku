import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ladangku/app/common/theme/app_colors.dart';
import 'package:ladangku/app/common/widget/button/google_login_button.dart';
import 'package:ladangku/app/common/widget/button/primary_button.dart';
import 'package:ladangku/app/common/widget/input/text_input_field.dart';
import 'package:ladangku/app/common/widget/scaffold/app_scaffold.dart';
import 'package:ladangku/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    final bottomPadding = mediaQuery.padding.bottom;

    return AppScaffold(
      backgroundColor: const Color(0xFFF4F6F0),
      safeAreaBottom: false,
      safeAreaTop: true,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                // --- BAGIAN ATAS (LOGO & TEKS) ---
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                    ],
                  ),
                ),

                // --- BAGIAN BAWAH (FORM PUTIH) ---
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                      vertical: height * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Masuk ke Ladangku',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: height * 0.04),

                        const TextInputField(hintText: 'Nama pengguna'),
                        SizedBox(height: height * 0.02),

                        const TextInputField(
                          hintText: 'Kata sandi',
                          isPassword: true,
                        ),
                        SizedBox(height: height * 0.01),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Lupa kata sandi?',
                              style: TextStyle(
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),

                        PrimaryButton(
                          text: 'Masuk',
                          textColor: AppColors.white,
                          backgroundColor: AppColors.primary,
                          onPressed: () {
                            // TODO : LOGIN CONTROLLER HANDLE
                          },
                        ),
                        SizedBox(height: height * 0.03),

                        Row(
                          children: [
                            Expanded(child: Divider(color: AppColors.lightOutline.withValues(alpha: 0.5))),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'atau',
                                style: TextStyle(
                                  color: AppColors.lightOutline,
                                  fontSize: width * 0.035,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: AppColors.lightOutline.withValues(alpha: 0.5))),
                          ],
                        ),
                        SizedBox(height: height * 0.03),

                        GoogleLoginButton(
                          onPressed: () {},
                        ),

                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tidak memiliki akun? ',
                              style: TextStyle(
                                color: AppColors.lightOnSurface,
                                fontSize: width * 0.035,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.ROLEPICKER);
                              },
                              child: Text(
                                'Buat akun',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: width * 0.035,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: bottomPadding),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}