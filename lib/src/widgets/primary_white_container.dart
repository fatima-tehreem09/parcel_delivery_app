import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';

class AppWhiteContainer extends StatelessWidget {
  const AppWhiteContainer({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(20),
    this.margin,
  });
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 10),
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
