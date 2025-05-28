import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/colors.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    super.key,
    this.color = AppColors.bgWhite,
    required this.icon,
    this.margin = const EdgeInsets.all(0),
    this.shouldShowBorder=false,
  });
  final Color color;
  final String icon;
  final EdgeInsetsGeometry margin;
  final bool shouldShowBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(12),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        border:shouldShowBorder? Border.all(
          color: Color(0xffEBEBEB),
          width: 1,
        ):null,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
