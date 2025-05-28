import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign_in/sign_in_view.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/helper_text.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../const/assets.dart';
import '../../../../const/colors.dart';
import '../../../../core/local/local_storage_repository.dart';
import '../../../../widgets/app_bar.dart';
import '../../providers/verification/timer_provider.dart';
import '../../widgets/general_heading.dart';
import '../../widgets/otp_text_field.dart';

class VerifyCodeView extends ConsumerStatefulWidget {
  const VerifyCodeView.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/verify-code";
  static const name = "VerifyCodeView";

  @override
  ConsumerState createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends ConsumerState<VerifyCodeView> {
  String otpCode = '';

  @override
  initState() {
    super.initState();
    ref.read(timerNotifierProvider.notifier).initState();
  }

  String? validateOtp(String? value) {
    if (value == null || value.length < 4) {
      return 'Please enter a valid 4-digit OTP';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final local = ref.watch(timerNotifierProvider);
    final state = ref.read(timerNotifierProvider.notifier);
    final isTimerCompleted = local.isTimerCompleted;
    String accessToken = ref.watch(localDataProvider).accessToken ?? '';
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: const AppBarWidget(
        shouldShowLeading: true,
        title: "Verification",
        leadingIcon: AppAssets.arrowSVG,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralHeading(
              heading: "Two-Factor Authentication",
              subheading: "We have sent OTP Code via email to $accessToken",
            ),
            20.height,
            AppOtpTextField(
              enabled: !isTimerCompleted,
              onCompleted: (value) {
                otpCode = value;
              },
              validator: validateOtp,
            ),
            20.height,
            HelperText(
              text: "Wait for ${isTimerCompleted ? '00:00 ' : state.timerText}",
              linkText: " Send Again",
              onTap: resendCodeMethod,
            ),
            50.height,
            AppButton(
              onPressed: () {
                context.goNamed(SignInView.name);
              },
              text: "Verify",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> resendCodeMethod() async {
    ref.read(timerNotifierProvider.notifier).resetTimer();
    ref.read(timerNotifierProvider.notifier).startTimeout();
  }
}
