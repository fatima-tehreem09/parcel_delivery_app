import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_textfield.dart';
import '../../auth/widgets/field_heading.dart';

class HelpSupport extends ConsumerStatefulWidget {
  const HelpSupport.builder(BuildContext context, GoRouterState state,
      {super.key});

  static const path = 'help-support';
  static const name = 'HelpSupport';

  @override
  ConsumerState createState() => _HelpSupportState();
}

class _HelpSupportState extends ConsumerState<HelpSupport> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(title: "Help & Support"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FieldHeading(
              text: "Email",
            ),
            AppTextField(
              textEditingController: _emailController,
              hint: "Johndoe@gail.com",
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.emailAddress,
            ),
            const FieldHeading(
              text: "Your Message",
            ),
            AppTextField(
              bigField: true,
              textEditingController: _messageController,
              hint: "Write your message here...",
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.text,
              maxLines: 10,
            ),
            50.heightBox,
            AppButton(
              isLoading: false,
              onPressed: () {},
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
