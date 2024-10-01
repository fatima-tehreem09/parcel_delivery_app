import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/forget_password/views/forget_password.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign-up/views/sign_up.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/auth_layout.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/field_heading.dart';
import 'package:abiola_along_client_app/src/features/home/views/home.dart';
import 'package:abiola_along_client_app/src/widgets/app_textfield.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/utils/input_validator.dart';

import '../../../../../const/colors.dart';
import '../../../../../core/local/local_storage_repository.dart';
import '../../../../../shared/states/app_loading_state.dart';
import '../../../../../utils/compute_action.dart';
import '../../../../../widgets/primary_button.dart';
import '../../../providers/auth_provider.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/sign_in';
  static const name = 'SignIn';

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignIn> with FormStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  /// TODO: Add validators to fields
  @override
  Widget build(BuildContext context) {
    final loadingState = ref.watch(authProvider);

    final isLoading = loadingState == const AppLoadingState.loading();
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver: $isDriver  ");
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: AuthLayout(
        heading: "Sign In",
        formChildren: [
          const FieldHeading(
            text: "Email",
          ),
          AppTextField(
            readOnly: isLoading,
            textEditingController: _emailController,
            hint: "Email Address",
            validator: InputValidator.email(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
          ),
          const FieldHeading(text: "Password"),
          AppPasswordField(
            readOnly: isLoading,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required";
              } else if (value.length < 8) {
                return "The password must be at least 8 characters long.";
              }
              return null;
            },
            textEditingController: _passwordController,
          ),
          10.heightBox,
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
              ),
              onPressed: () {
                context.pushNamed(ForgetPassword.name);
              },
              child: OnestText(
                "Forgot Password?",
                color: const Color(0xff6B7280),
                size: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          50.heightBox,
          AppButton(isLoading: isLoading, onPressed: submitter, text: "Sign In"),
          50.heightBox,
          Align(
            alignment: Alignment.bottomCenter,
            child: Text.rich(
              TextSpan(
                text: "Don’t have an account? ",
                style: GoogleFonts.onest(
                  color: AppColors.hintDarkGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed(SignUp.name);
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
      ),
    );
  }

  @override
  Future<void> onSubmit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final result =
    await ref.read(authProvider.notifier).signIn(
      context,
        _emailController.text,
        _passwordController.text
    );
  //   await computeAction(
  //   context,
  //       () async => await ref.read(authProvider.notifier).signIn(
  //     _emailController.text,
  //     _passwordController.text
  //   ),
  // );
if(result){
  context.pushNamed(Home.name);

}
  }
}
