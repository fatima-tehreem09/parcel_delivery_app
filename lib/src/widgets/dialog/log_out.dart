import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign_in/views/sign_in.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/base_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/inter_text.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignOutDialog extends ConsumerStatefulWidget {
  const SignOutDialog({super.key});

  @override
  ConsumerState createState() => _SignOutDialogState();

  Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => this,
        ) ??
        false;
  }
}

class _SignOutDialogState extends ConsumerState<SignOutDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      children: [
        Image.asset(
          AppAssets.logo,
          width: 80,
        ),
        20.heightBox,
        OnestText(
          textAlign: TextAlign.center,
          "Are you sure you want to sign out?",
          size: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryBlack,
        ),
        25.heightBox,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => context.pop(),
                child: InterText(
                  "No",
                  color: AppColors.primaryBlack,
                  size: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: PrimaryButton(
                isLoading: false,
                isLogout: true,
                onPressed: () {
                  ref.read(localDataProvider).clearAllData();
                  context.goNamed(SignIn.name);
                },
                text: "Yes",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
