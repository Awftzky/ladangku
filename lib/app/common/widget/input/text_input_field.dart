import 'package:flutter/material.dart';
import 'package:ladangku/app/common/theme/app_colors.dart';

class TextInputField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;

  const TextInputField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<TextInputField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<TextInputField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    // Default tertutup kalau dia password
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        // Warna teks hint disesuaikan biar soft
        hintStyle: TextStyle(
          color: AppColors.primary.withValues(alpha: 0.7),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        // Sesuai Figma: Background beige terang (bisa disesuaikan kalau kurang pas)
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none, // Hilangin garis tepi
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

        // Logic buat nampilin icon mata kalau dia password
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.primary,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}