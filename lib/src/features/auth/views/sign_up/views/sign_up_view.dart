import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign_in/sign_in_view.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/helper_text.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/reusables.dart';

import '../../../../../widgets/app_textfield.dart';
import '../../../widgets/general_heading.dart';
import '../../../widgets/heading.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/sign-up";
  static const name = "SignUpView";

  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> with FormStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

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
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isLoading =
    //     ref.watch(signInProvider) == const AppLoadingState.loading();
    // final _=ref.watch(userByIdProvider);
    return AbsorbPointer(
      absorbing: false,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: AppBarWidget(
          shouldShowLeading: true,
          title: "Create Your Account",
          leadingIcon: AppAssets.arrowSVG,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const GeneralHeading(),
                HeadingText(text: "Full Name").leftAlignment,
                4.5.height,
                AppTextField(
                  textEditingController: nameController,
                  hint: "Enter your full name",
                  textInputAction: TextInputAction.next,
                  validator: InputValidator.required(),
                ),
                16.height,
                const HeadingText(
                  text: "Email",
                ).leftAlignment,
                4.5.height,
                AppTextField(
                  keyboardType: TextInputType.emailAddress,
                  validator: InputValidator.email(),
                  textEditingController: emailController,
                  hint: "exampleabc@email.com",
                  textInputAction: TextInputAction.next,
                ),
                16.height,
                const HeadingText(
                  text: "Phone Number",
                ).leftAlignment,
                4.5.height,
                AppTextField(
                  keyboardType: TextInputType.number,
                  validator: InputValidator.required(),
                  textEditingController: phoneController,
                  hint: "Enter your phone number",
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                16.height,
                const HeadingText(
                  text: "Password",
                ).leftAlignment,
                4.5.height,
                AppPasswordField(
                  padding: 0.0,
                  textEditingController: passwordController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password is required";
                    } else if (val.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                16.height,
                const HeadingText(
                  text: "Confirm Password",
                ).leftAlignment,
                4.5.height,
                AppPasswordField(
                  textEditingController: confirmPasswordController,
                  padding: 30,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password is required";
                    } else if (val.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                AppButton(
                  onPressed: submitter,
                  text: "Continue",
                ),
                15.height,
                HelperText(
                  text: "Already have an account? ",
                  linkText: "Sign In",
                  onTap: () {
                    context.pushNamed(SignInView.name);
                  },
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
    // final data = await performNetworkOperation(
    //   context,
    //   () => ref.read(signInProvider.notifier).signIn(
    //         SignInModel(
    //           password: passwordController.text,
    //           email: emailController.text,
    //         ),
    //       ),
    // );
    // if (data == null) return;
    // if (!mounted) return;
    // context.goNamed(HomeView.name);
  }
}
