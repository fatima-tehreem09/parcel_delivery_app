import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/base_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({
    super.key,
    this.isVerificationLink = false,
    this.isPaymentMethodVerification = false,
    this.isPaymentSuccessful = false,
  });

  final bool isVerificationLink;
  final bool isPaymentMethodVerification;
  final bool isPaymentSuccessful;

  Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => this,
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      children: [
        if (isPaymentMethodVerification || isPaymentSuccessful) ...[
          SvgPicture.asset(
            AppAssets.greenTick,
            width: 48,
            height: 48,
          ),
          20.heightBox,
        ],
        OnestText(
          isPaymentSuccessful
              ? 'Payment Successful'
              : isPaymentMethodVerification
                  ? 'Payment Method Verified'
                  : isVerificationLink
                      ? 'Verification Link'
                      : 'Email Verification',
          size: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
        15.heightBox,
        OnestText(
          textAlign: TextAlign.center,
          isPaymentSuccessful
              ? "Your delivery request is currently live, and a nearby driver has accepted your request in a while."
              : isPaymentMethodVerification
                  ? "Your payment method has been successfully verified. Now you can pay with this card."
                  : "A verification link is shared on your Email. Please check your email for account verification.",
          size: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.hintDarkGrey,
        ),
      ],
    );
  }
}
