import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../widgets/text_widget.dart';

class FieldHeading extends StatelessWidget {
  const FieldHeading({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 20),
      child: OnestText(
        text,
        size: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlack,
      ),
    );
  }
}
