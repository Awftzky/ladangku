import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ladangku/app/common/theme/app_colors.dart';
import 'package:ladangku/app/common/widget/button/primary_button.dart';
import 'package:ladangku/app/common/widget/input/text_input_field.dart'; // Sesuaikan sama nama file lu
import 'package:ladangku/app/common/widget/scaffold/app_scaffold.dart';
import 'package:ladangku/app/routes/app_pages.dart';

import '../controllers/register_consumer_controller.dart';

class RegisterConsumerView extends GetView<RegisterConsumerController> {
  const RegisterConsumerView({super.key});

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
                // --- BAGIAN ATAS (BACK BUTTON, LOGO & TEKS) ---
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      // Tombol Back di Kiri Atas
                      Positioned(
                        top: height * 0.02,
                        left: width * 0.04,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.lightOnSurface.withValues(alpha: 0.8),
                            size: 28,
                          ),
                          onPressed: () => Get.back(),
                        ),
                      ),

                      // Logo & Teks Tetap di Tengah
                      Align(
                        alignment: Alignment.center,
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
                    ],
                  ),
                ),

                // --- BAGIAN BAWAH (FORM PUTIH) ---
                Expanded(
                  flex: 8, // Gw taikin flex-nya dikit karena formnya lebih panjang dari Login
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
                          'Buat Akun Consumer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: height * 0.04),

                        // Input 1: Nama lengkap
                        const TextInputField(hintText: 'Nama lengkap'),
                        SizedBox(height: height * 0.02),

                        // Input 2: Nama pengguna
                        const TextInputField(hintText: 'Nama pengguna'),
                        SizedBox(height: height * 0.02),

                        // Input 3: Email
                        const TextInputField(hintText: 'Email'),
                        SizedBox(height: height * 0.02),

                        // Input 4: Nomor ponsel
                        const TextInputField(hintText: 'Nomor ponsel'),
                        SizedBox(height: height * 0.02),

                        // Input 5: Kata sandi
                        const TextInputField(
                          hintText: 'Kata sandi',
                          isPassword: true,
                        ),
                        SizedBox(height: height * 0.04), // Margin agak jauh sebelum button

                        // Tombol Daftar
                        PrimaryButton(
                          text: 'Daftar',
                          textColor: AppColors.white,
                          backgroundColor: AppColors.primary,
                          onPressed: () {
                            // TODO : REGISTER CONTROLLER HANDLE
                          },
                        ),

                        const Spacer(), // Dorong teks Login ke bawah

                        // --- Teks Paling Bawah ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah memiliki akun? ',
                              style: TextStyle(
                                color: AppColors.lightOnSurface,
                                fontSize: width * 0.035,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Langsung lempar ke halaman Login
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: Text(
                                'Login',
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