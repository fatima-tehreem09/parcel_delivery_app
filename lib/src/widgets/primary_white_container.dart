import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';

class PrimaryWhiteContainer extends StatelessWidget {
  const PrimaryWhiteContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
