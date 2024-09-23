import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:surgemate_client_app/src/features/auth/views/forget_password/verify_code_view.dart';
import 'package:surgemate_client_app/src/features/auth/widgets/general_heading.dart';
import 'package:surgemate_client_app/src/widgets/app_bar.dart';

import 'email_view.dart';

class ForgetPasswordView extends ConsumerStatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  ConsumerState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends ConsumerState<ForgetPasswordView>
    with FormStateMixin {
  int viewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GeneralHeading(
              topPadding: 60,
              heading: "Forget Password",
              subheading:
                  "Recover your password by entering the valid details.",
            ),
            Expanded(
              child: PageView(
                children: [
                  if (viewIndex == 0)
                    EmailView(
                      onViewChange: (index) {
                        setState(() {
                          viewIndex = index;
                        });
                      },
                      viewIndex: viewIndex,
                    ),
                  if (viewIndex == 1) const VerifyCodeView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
