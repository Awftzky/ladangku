import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ladangku/app/common/theme/app_colors.dart';
import 'package:ladangku/app/common/widget/button/primary_button.dart';
import 'package:ladangku/app/common/widget/input/dropdown_input_field.dart';
import 'package:ladangku/app/common/widget/input/text_input_field.dart';
import 'package:ladangku/app/common/widget/scaffold/app_scaffold.dart';
import 'package:ladangku/app/routes/app_pages.dart';

import '../controllers/register_farmer_controller.dart';

class RegisterFarmerView extends GetView<RegisterFarmerController> {
  const RegisterFarmerView({super.key});

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
                  flex: 2, // Flex dikecilin dikit biar form bawah dapat space lebih banyak
                  child: Stack(
                    children: [
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
                  flex: 9, // Flex digedein karena inputan petani banyak
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
                          'Buat Akun Petani',
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

                        // Input 2: Nama kelompok tani / Ladang
                        const TextInputField(hintText: 'Nama ladang / Kelompok tani'),
                        SizedBox(height: height * 0.02),

                        // Input 3: Email & No HP (Dibikin Row biar hemat layar)
                        Row(
                          children: [
                            const Expanded(child: TextInputField(hintText: 'Email')),
                            SizedBox(width: width * 0.03),
                            const Expanded(child: TextInputField(hintText: 'Nomor ponsel')),
                          ],
                        ),
                        SizedBox(height: height * 0.02),

                        // Input 4: Dropdown Metode Tanam
                        DropdownInputField(
                          hintText: 'Pilih Metode Tanam',
                          items: const ['Organik', 'Konvensional'],
                          onChanged: (value) {
                            // TODO: Masukin ke controller.selectedMetode.value
                          },
                        ),
                        SizedBox(height: height * 0.02),

                        // Input 5: Data Rekening (Bank & Nomor)
                        Row(
                          children: [
                            Expanded(
                              flex: 2, // Proporsi lebar dropdown bank lebih kecil
                              child: DropdownInputField(
                                hintText: 'Bank',
                                items: const ['BCA', 'BNI', 'BSI', 'BRI', 'Mandiri'],
                                onChanged: (value) {
                                  // TODO: Masukin ke controller.selectedBank.value
                                },
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            const Expanded(
                              flex: 3, // Proporsi isian no rekening lebih panjang
                              child: TextInputField(hintText: 'Nomor rekening'),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),

                        // Input 6: Kata sandi
                        const TextInputField(
                          hintText: 'Kata sandi',
                          isPassword: true,
                        ),
                        SizedBox(height: height * 0.04),

                        // Tombol Daftar
                        PrimaryButton(
                          text: 'Daftar',
                          textColor: AppColors.white,
                          backgroundColor: AppColors.primary,
                          onPressed: () {
                            // Action daftar
                          },
                        ),

                        const Spacer(),

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