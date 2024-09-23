import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:surgemate_client_app/src/extension/widget_extension.dart';
import 'package:surgemate_client_app/src/features/auth/providers/sign_up/sign_up_provider.dart';
import 'package:surgemate_client_app/src/features/auth/views/sign_up/views/employment_details_view.dart';
import 'package:surgemate_client_app/src/features/auth/views/sign_up/views/password_view.dart';
import 'package:surgemate_client_app/src/features/auth/views/sign_up/views/personal_detail_view.dart';
import 'package:surgemate_client_app/src/features/auth/views/sign_up/views/photo_view.dart';

import '../../../../constants/colors.dart';
import '../../../../theme/theme_provider/theme_provider.dart';
import '../../../../utils/api_call_action.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/buttons/app_button.dart';
import '../../widgets/check_list_tile.dart';
import '../../widgets/general_heading.dart';
import '../sign_in/sign_in_view.dart';
import '../verification/views/upload_doc_view.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/sign-up";
  static const name = "signUp";

  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  int currentPage = 0;
  var _autoValidateMode = AutovalidateMode.disabled;

  final keys = <GlobalKey<FormState>>[
    GlobalKey(debugLabel: 'first'),
    GlobalKey(debugLabel: 'second'),
    GlobalKey(debugLabel: 'third'),
    GlobalKey(debugLabel: 'fourth'),
  ];

  late List<Widget> views;

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    views = [
      const PersonalDetailView(),
      const EmploymentDetailsView(),
      const PhotoView(),
      const PasswordView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _ = ref.watch(appThemeProvider);
    bool mode = _ == ThemeMode.dark;
    final signUpState = ref.watch(signUpProvider);
    final isCreating = signUpState.isLoading;
    return AbsorbPointer(
      absorbing: isCreating,
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          if (currentPage == 0) {
            context.pop();
            return;
          }
          currentPage--;
          setState(() {});
        },
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: currentPage != 0
              ? CustomAppBar(
                  onPressed: () {
                    currentPage--;
                    setState(() {});
                  },
                )
              : null,
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0.0, 20, 30),
            child: Form(
              key: keys[currentPage],
              autovalidateMode: _autoValidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (currentPage != 0)
                    const GeneralHeading(topPadding: 50)
                  else
                    const GeneralHeading(),
                  views[currentPage],
                  if (currentPage == 3) ...[
                    20.height,
                    CheckListTileWidget(
                      value: isChecked,
                      onChanged: (v) => isChecked = v!,
                      text: Text.rich(
                        TextSpan(
                          text: "Agree to Surge Mate Pro ",
                          style: theme.primaryTextTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: "Terms of Service",
                              style:
                                  theme.primaryTextTheme.bodyMedium?.copyWith(
                                decorationColor: AppColors.greyDark,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(
                              text: " and ",
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style:
                                  theme.primaryTextTheme.bodyMedium?.copyWith(
                                decorationColor: AppColors.greyDark,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    50.height,
                  ],
                  PrimaryButton(
                    onPressed: () async {
                      if (!keys[currentPage].currentState!.validate()) {
                        _autoValidateMode = AutovalidateMode.onUserInteraction;
                        setState(() {});
                        return;
                      }
                      keys[currentPage].currentState!.save();
                      if (currentPage == 3) {
                        signUp();
                      } else {
                        currentPage++;
                        _autoValidateMode = AutovalidateMode.disabled;
                        setState(() {});
                      }
                    },
                    buttonText: isCreating ? "Please Wait..." : "Next",
                  ),
                  if (currentPage == 0 &&
                      MediaQuery.of(context).viewInsets.bottom == 0) ...[
                    30.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text.rich(
                        TextSpan(
                          text: "Already Have an Account? ",
                          style: theme.primaryTextTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: "Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.goNamed(SignInView.name);
                                },
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    50.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 53, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mode
                                ? const Color(0xff141D2F)
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: mode ? const Color(0xff212C42) : Colors.white,
                        ),
                        child: Text(
                          "SurgeMatePro is available to veterinarians and veterinary students only. Verification of credentials is required for sign-up.",
                          style: theme.primaryTextTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final notifier = ref.read(signUpProvider.notifier);
    final response = await performNetworkOperation(
      context,
      notifier.signUp,
    );
    if (response == null) return;
    if (!mounted) return;
    context.goNamed(UploadDocumentView.name);
  }
}
