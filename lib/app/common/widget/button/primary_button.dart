import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;

  final double? width;
  final double height;
  final double textSize;
  final FontWeight fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.width,
    this.height = 52,
    this.textSize = 16,
    this.fontWeight = FontWeight.bold,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = width ?? (screenWidth > 400 ? 400 : screenWidth);

    return Center(
      child: SizedBox(
        width: buttonWidth,
        height: height,
        child: isOutlined ? _buildOutlinedButton() : _buildElevatedButton(),
      ),
    );
  }

  // --- Style 1: Tombol Utama ---
  Widget _buildElevatedButton() {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        // Kalau ga dikasih warna, otomatis pakai Hijau default Ladangku
        backgroundColor: backgroundColor ?? const Color(0xFF4CAF50),
        foregroundColor: textColor ?? Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: isLoading
          ? const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2.5,
        ),
      )
          : Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  // --- Style 2: Tombol Sekunder ---
  Widget _buildOutlinedButton() {
    // Tentukan warna border & text (default hijau Ladangku)
    final defaultColor = borderColor ?? const Color(0xFF4CAF50);

    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor ?? defaultColor,
        side: BorderSide(color: defaultColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: isLoading
          ? SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: defaultColor,
          strokeWidth: 2.5,
        ),
      )
          : Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}