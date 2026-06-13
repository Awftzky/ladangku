import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladangku/app/common/theme/app_colors.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleLoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = context.width;

    return SizedBox(
      width: double.infinity,
      height: 52, // Disamain sama tinggi PrimaryButton lu
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.background, // Background beige terang
          foregroundColor: AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Radius sesuai desain
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pastikan path image ini sesuai sama file logo google lu
            Image.asset('assets/logo/google_logo.png', height: 24),
            const SizedBox(width: 12),
            Text(
              'Masuk dengan akun Google',
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}