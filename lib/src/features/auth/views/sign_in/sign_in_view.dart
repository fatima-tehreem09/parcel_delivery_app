import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/views/home.dart';
import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/reusables.dart';

import '../../../../const/colors.dart';
import '../../../../widgets/app_textfield.dart';
import '../../widgets/check_list_tile.dart';
import '../../widgets/general_heading.dart';
import '../../widgets/heading.dart';
import '../../widgets/helper_text.dart';

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

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // bool isLoading =
    // ref.watch(signInProvider) == const AppLoadingState.loading();
    // final _=ref.watch(userByIdProvider);
    return AbsorbPointer(
      absorbing: false,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: -10,
                child: SvgPicture.asset(AppAssets.bgPattern),
              ),
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.assessmentLogo,
                        height: 34,
                      ),
                      24.height,
                      const GeneralHeading(
                        heading: "Get Started now",
                        subheading:
                            "Create an account or log in to explore about our app",
                      ),
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
                        text: "Password",
                      ).leftAlignment,
                      4.5.height,
                      AppPasswordField(
                        textEditingController: passwordController,
                        padding: 16,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Password is required";
                          } else if (val.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckListTileWidget(
                              value: _rememberMe,
                              text: "Remember me",
                              onChanged: (val) {
                                _rememberMe = val ?? false;
                                setState(() {});
                              },
                            ),
                          ),
                          TextButton(
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
                            child: InterTightText(
                              "Forgot Password ?",
                              fontWeight: FontWeight.w500,
                              size: 12,
                              color: AppColors.greenPrimary,
                            ),
                          ),
                        ],
                      ),
                      25.5.height,
                      AppButton(
                        onPressed: submitter,
                        // text: isLoading ? "Please Wait.." : "Login",
                        text: "Login",
                      ),
                      15.height,
                      HelperText(
                        text: "Don\'t have an account? ",
                        linkText: "Create one",
                        onTap: () {},
                      ),
                      50.height,
                    ],
                  ),
                ),
              ),
            ],
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
    context.goNamed(Home.name);
  }
}
