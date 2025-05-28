import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/colors.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    super.key,
    this.color = AppColors.bgWhite,
    required this.icon,
    this.margin = const EdgeInsets.all(0),
    this.shouldShowBorder = false,
    this.isPng = false,
    this.width = 40,
    this.height = 40,
  });

  final Color color;
  final String icon;
  final EdgeInsetsGeometry margin;
  final bool shouldShowBorder;
  final bool isPng;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(12),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: shouldShowBorder
            ? Border.all(
                color: const Color(0xffEBEBEB),
                width: 1,
              )
            : null,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: isPng
            ? Image.asset(icon)
            : SvgPicture.asset(
                icon,
                fit: BoxFit.scaleDown,
              ),
      ),
    );
  }
}
