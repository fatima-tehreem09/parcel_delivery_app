import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLogout = false,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isLogout;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:
            // isLoading ? const Color(0xffE5E7EB) :
            AppColors.greenPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        minimumSize: const Size(double.infinity, 48),
        elevation: 0.0,
        overlayColor: Colors.transparent,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : Center(
              child: OnestText(
                text,
                size: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryWhite,
              ),
            ),
    );
  }
}
