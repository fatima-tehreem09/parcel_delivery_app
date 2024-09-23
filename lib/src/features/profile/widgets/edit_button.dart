import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        minimumSize: Size.zero,
        elevation: 0.0,
        overlayColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: Center(
        child: OnestText(
          "Edit",
          size: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryWhite,
        ),
      ),
    );
  }
}
