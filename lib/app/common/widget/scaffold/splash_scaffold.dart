import 'package:flutter/material.dart';
import 'package:ladangku/app/common/theme/app_colors.dart';
import 'package:ladangku/app/common/widget/scaffold/app_scaffold.dart';

class SplashScaffold extends StatelessWidget {
  final Widget body;

  const SplashScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeAreaBottom: false,
      backgroundImage: const DecorationImage(
        image: AssetImage("assets/image/splash_background.png"),
        fit: BoxFit.cover,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Atas: Transparan total (Alpha 0%)
              AppColors.primary.withValues(alpha: 0.0),

              // Tengah: Mulai muncul bayangan hijau gelap (Alpha 45%)
              AppColors.primary.withValues(alpha: 0.45),

              // Bawah: Hijau gelap pekat biar teks putih kontras (Alpha 90%)
              AppColors.primary.withValues(alpha: 0.90),
            ],
            stops: const [0.0, 0.5, 0.8],
          ),
        ),
        child: body,
      ),
    );
  }
}