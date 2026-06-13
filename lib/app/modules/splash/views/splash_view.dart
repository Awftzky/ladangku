import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladangku/app/common/theme/app_colors.dart';
import 'package:ladangku/app/common/widget/button/primary_button.dart';
import 'package:ladangku/app/common/widget/scaffold/splash_scaffold.dart';
import 'package:ladangku/app/routes/app_pages.dart';
import '../controllers/splash_controller.dart';

/* NOTES : SPLASH VIEW
  - View ini adalah view pertama yang akan ditampilkan saat aplikasi dijalankan
  - TODO : LAKUKAN TESTING
*/
class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Simpan dimensi layar di variabel lokal biar irit memori dan rapi dipanggilnya
    final width = context.width;
    final height = context.height;

    return SplashScaffold(
      body: SafeArea(
        child: Padding(
          // Padding horizontal ~6% dari lebar layar, vertical ~3% dari tinggi layar
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Logo di Kanan Atas
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/logo/logo.png',
                  // Ukuran logo diset ~12% dari lebar layar
                  // Kita pakai width dua-duanya biar logonya tetep berbentuk persegi sempurna (1:1)
                  width: width * 0.12,
                  height: width * 0.12,
                ),
              ),

              const Spacer(),

              // 3. Judul
              Text.rich(
                const TextSpan(
                  text: 'Mulai perjalanan panen digital\nbersama ',
                  children: [
                    TextSpan(
                      text: 'Ladangku',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: width * 0.070,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),

              SizedBox(height: height * 0.015),

              // 4. Subjudul
              Text(
                'Dari lahan ke marketplace, semua hasil panen tercatat lebih transparan.',
                style: TextStyle(
                  fontSize: width * 0.045,
                  color: Colors.white.withValues(
                    alpha: 0.9,
                  ),
                  height: 1.4,
                ),
              ),

              // Jarak ~5% dari tinggi layar
              SizedBox(height: height * 0.05),

              // 5. Tombol Primary Button
              PrimaryButton(
                text: 'Masuk',
                backgroundColor: AppColors.white,
                textColor: AppColors.primary,
                // Ukuran teks tombol ~5% dari lebar layar
                textSize: width * 0.04,
                fontWeight: FontWeight.w900,
                borderRadius: 100,
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
              ),

              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}