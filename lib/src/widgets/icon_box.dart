import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    super.key,
    required this.color,
    required this.icon,
    this.margin = const EdgeInsets.all(0),
  });
  final Color color;
  final String icon;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
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
