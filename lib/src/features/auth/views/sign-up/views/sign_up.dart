import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign_in/views/sign_in.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/auth_layout.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/field_heading.dart';
import 'package:abiola_along_client_app/src/widgets/app_textfield.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/email_verification_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reusables/mixins/form_state_mixin.dart';

import '../../../../../const/colors.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/sign_up';
  static const name = 'SignUp';

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> with FormStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _vehicleModelController.dispose();
    _licenseController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  /// TODO: Add validators to fields
  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver: $isDriver  ");
    return AuthLayout(
      heading: "Sign Up",
      formChildren: [
        const FieldHeading(
          text: "Email",
        ),
        AppTextField(
          textEditingController: _emailController,
          hint: "Email Address",
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.go,
        ),
        const FieldHeading(text: "Phone"),
        AppTextField(
          textEditingController: _phoneController,
          hint: "Phone Number",
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textInputAction: TextInputAction.go,
        ),
        if (isDriver) ...[
          const FieldHeading(text: "Vehicle Model"),
          AppTextField(
            textEditingController: _vehicleModelController,
            hint: "Model Name",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
          ),
          const FieldHeading(text: "License"),
          AppTextField(
            textEditingController: _licenseController,
            hint: "License Plate Number",
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            textInputAction: TextInputAction.go,
          ),
        ],
        const FieldHeading(text: "Password"),
        AppPasswordField(
          textEditingController: _passwordController,
        ),
        const FieldHeading(text: "Confirm Password"),
        AppPasswordField(
          textEditingController: _confirmPasswordController,
        ),
        50.heightBox,
        PrimaryButton(
            onPressed: () {
              const VerificationDialog().show(context);
            },
            text: "Sign Up"),
        50.heightBox,
        Align(
          alignment: Alignment.bottomCenter,
          child: Text.rich(
            TextSpan(
              text: "Already Have an account? ",
              style: GoogleFonts.onest(
                color: AppColors.hintDarkGrey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "Sign In",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushNamed(
                        SignIn.name,
                      );
                    },
                  style: GoogleFonts.onest(
                    color: AppColors.lightBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
