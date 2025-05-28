import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../widgets/inter_tight_text.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({super.key, required this.title, required this.buttonText});
  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InterTightText(
          'My Assets',
          size: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.blackPrimary,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // TODO: Implement view all functionality
          },
          child: InterTightText(
            'View All',
            size: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.greenPrimary,
          ),
        ),
      ],
    );
  }
}
