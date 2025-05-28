import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';

import '../../../const/colors.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return InterTightText(
      text,
      color: AppColors.textGrey,
      fontWeight: FontWeight.w500,
      size: 12,
    );
  }
}
