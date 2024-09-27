import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/forget_password/views/update_password.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/auth_layout.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/field_heading.dart';
import 'package:abiola_along_client_app/src/widgets/app_textfield.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/email_verification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/utils/input_validator.dart';

import '../../../../../widgets/primary_button.dart';

class ForgetPassword extends ConsumerStatefulWidget {
  const ForgetPassword.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/forget_password';
  static const name = 'ForgetPassword';

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<ForgetPassword> with FormStateMixin {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  /// TODO: Add validators to fields
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: AuthLayout(
        heading: "Recover Password",
        formChildren: [
          const FieldHeading(
            text: "Enter Email For Verification Link",
          ),
          AppTextField(
            textEditingController: _emailController,
            hint: "Email Address",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            validator: InputValidator.required(),
          ),
          50.heightBox,
          AppButton(
            onPressed: () {
              /// Just to show dialog and navigation, will be changed to actual logic later
              Future.delayed(const Duration(seconds: 1), () {
                const VerificationDialog(isVerificationLink: true)
                    .show(context);
                context.pushNamed(UpdatePassword.name);
              });
            },
            text: "Get Link",
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
