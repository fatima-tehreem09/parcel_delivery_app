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
            AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isLogout ? 20 : 100),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(
            horizontal: isLogout ? 10 : 20, vertical: isLogout ? 10 : 16),
        minimumSize: const Size(double.infinity, 52),
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
