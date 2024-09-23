import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/reusables.dart';
import 'package:surgemate_client_app/src/core/auth/domain/models/sign_in_model/sign_in_model.dart';
import 'package:surgemate_client_app/src/extension/widget_extension.dart';
import 'package:surgemate_client_app/src/features/auth/providers/sign_in/sign_in_provider.dart';

import '../../../../constants/colors.dart';
import '../../../../shared/states/loading_state/app_loading_state.dart';
import '../../../../utils/api_call_action.dart';
import '../../../../widgets/buttons/app_button.dart';
import '../../../../widgets/text_field/app_text_field.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../widgets/general_heading.dart';
import '../../widgets/heading.dart';
import '../sign_up/sign_up_view.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/sign-in";
  static const name = "SignInView";

  @override
  ConsumerState createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> with FormStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      emailController.text = "haroon@gmail.com";
      passwordController.text = "12345678";
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading =
        ref.watch(signInProvider) == const AppLoadingState.loading();
    // final _=ref.watch(userByIdProvider);
    final theme = Theme.of(context);
    return AbsorbPointer(
      absorbing: isLoading,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GeneralHeading(
                  // color: AppColors.customBlack,
                  heading: "Log in",
                  subheading: "Welcome back! Please log in to your account.",
                ),
                const HeadingText(
                  text: "Email Address",
                ),
                10.height,
                AppTextField(
                  keyboardType: TextInputType.emailAddress,
                  validator: InputValidator.email(),
                  borderRadius: 50,
                  textEditingController: emailController,
                  hint: "exampleabc@email.com",
                  textInputAction: TextInputAction.next,
                ),
                20.height,
                const HeadingText(
                  text: "Password",
                ),
                10.height,
                AppPasswordField(
                  textEditingController: passwordController,
                  borderRadius: 50,
                  padding: 0,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password is required";
                    } else if (val.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                10.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AppColors.primaryBlue,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () {
                      // context.pushNamed(VerificationView.name);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: theme.primaryTextTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                50.height,
                PrimaryButton(
                  onPressed: submitter,
                  buttonText: isLoading ? "Please Wait.." : "Next",
                ),
                30.height,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text.rich(
                    TextSpan(
                      text: "Don’t Have an Account? ",
                      style: theme.primaryTextTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: "Create Account",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(SignUpView.name);
                            },
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                50.height,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Future<void> onSubmit() async {
    final data = await performNetworkOperation(
      context,
      () => ref.read(signInProvider.notifier).signIn(
            SignInModel(
              password: passwordController.text,
              email: emailController.text,
            ),
          ),
    );
    if (data == null) return;
    if (!mounted) return;
    context.goNamed(HomeView.name);
  }
}
