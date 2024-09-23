import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surgemate_client_app/src/constants/app_constant.dart';
import 'dart:ui';

import 'package:surgemate_client_app/src/constants/colors.dart';
import 'package:surgemate_client_app/src/theme/theme_provider/theme_provider.dart';

class GlassmorphismBox extends ConsumerStatefulWidget {
  final double height;
  final BorderRadius? borderRadius;
  final Color? color;
  final EdgeInsets? padding;
  final Widget child;
  const GlassmorphismBox({
    super.key,
    required this.height,
    required this.child,
    this.borderRadius,
    this.padding,
    this.color,
  });

  @override
  ConsumerState<GlassmorphismBox> createState() => _GlassmorphismBoxState();
}

class _GlassmorphismBoxState extends ConsumerState<GlassmorphismBox> {
  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(appThemeProvider);
    bool mode = _ == ThemeMode.dark;
    return PreferredSize(
      preferredSize: const Size(double.infinity, 100),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: widget.padding ?? AppConstant.generalPadding,
            decoration: BoxDecoration(
              color: widget.color ?? Colors.black.withOpacity(0.01),
              border: Border.all(
                color: AppColors.getBorderColor(mode),
              ),
              borderRadius: widget.borderRadius ??
                  const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
            ),
            height: 100,
            width: double.infinity,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
