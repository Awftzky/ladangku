import 'package:flutter/material.dart';
import 'package:ladangku/app/common/theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool useGradient;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;
  final bool? isExtend;
  final Widget? header; 
  final bool? isFixed;

  // --- Tambahan Parameter Baru ---
  final bool safeAreaBottom;
  final bool safeAreaTop;

  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.useGradient = false,
    this.backgroundColor,
    this.backgroundImage,
    this.isExtend,
    this.header,
    this.isFixed,
    this.safeAreaBottom = true, // Default true biar halaman lain nggak berantakan
    this.safeAreaTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: useGradient
            ? null
            : (backgroundColor ?? AppColors.defaultBackground),
        image: backgroundImage,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        extendBodyBehindAppBar: isExtend ?? true,
        floatingActionButton: floatingActionButton,
        body: body == null
            ? null
            : SafeArea(
          top: safeAreaTop,
          bottom: safeAreaBottom, // Sekarang ngikutin parameter dari luar
          child: _buildBodyWithHeader(),
        ),
      ),
    );
  }

  Widget _buildBodyWithHeader() {
    if (header == null) {
      return body ?? const SizedBox.shrink();
    }

    return Stack(
      children: [
        if (isFixed == false)
          Positioned(top: 0, left: 0, right: 0, child: header!),
        body ?? const SizedBox.shrink(),

        if (isFixed == true)
          Positioned(top: 0, left: 0, right: 0, child: header!),
      ],
    );
  }
}