import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/auth_layout.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/field_heading.dart';
import 'package:abiola_along_client_app/src/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/mixins/form_state_mixin.dart';

import '../../../../../widgets/primary_button.dart';

class UpdatePassword extends ConsumerStatefulWidget {
  const UpdatePassword.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/update_password';
  static const name = 'UpdatePassword';

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<UpdatePassword> with FormStateMixin {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  /// TODO: Add validators to fields
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      heading: "Update Password",
      formChildren: [
        const FieldHeading(text: "Password"),
        AppPasswordField(
          textEditingController: _passwordController,
        ),
        const FieldHeading(text: "Confirm Password"),
        AppPasswordField(
          textEditingController: _passwordController,
        ),
        50.heightBox,
        PrimaryButton(onPressed: () {}, text: "Update Password"),
      ],
    );
  }
}
