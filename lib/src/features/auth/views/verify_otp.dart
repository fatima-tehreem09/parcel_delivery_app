import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/countdown_timer.dart';
import '../widgets/otp_text_field.dart';

class VerifyCodeView extends ConsumerStatefulWidget {
  const VerifyCodeView({super.key});

  @override
  ConsumerState createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends ConsumerState<VerifyCodeView> {
  bool countdownFinished = false;

  void handleCountdownFinish() {
    setState(() {
      countdownFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verification Code",
          style: theme.primaryTextTheme.labelLarge,
        ),
        12.height,
        Text(
          "Enter verification code you received on email address.",
          style: theme.primaryTextTheme.bodyMedium,
        ),
        20.height,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOtpTextField(
                enabled: !countdownFinished,
              ),
              25.width,
              AppOtpTextField(
                enabled: !countdownFinished,
              ),
            ],
          ),
        ),
        20.height,
        Align(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Code resend in: ",
                style: theme.primaryTextTheme.bodyMedium,
              ),
              CountdownTimer(
                onComplete: handleCountdownFinish,
                seconds: 120,
              ),
            ],
          ),
        ),
        50.height,
        AppButton(
          onPressed: () {},
          text: countdownFinished ? "Resend code" : "Verify",
        ),
      ],
    );
  }
}
