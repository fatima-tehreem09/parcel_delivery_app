import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign-up/views/sign_up.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class UserType extends ConsumerWidget {
  const UserType.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/user_type';
  static const name = 'UserType';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.paddingOf(context).top + 14.0, 20, 20),
        child: Column(
          children: [
            Image.asset(
              AppAssets.logo,
              width: 78,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            _getTile(
              "User",
              AppAssets.userIcon,
              () {
                ref.read(localDataProvider).saveUserType("user");
                context.pushNamed(SignUp.name);
              },
            ),
            20.heightBox,
            _getTile(
              "Driver",
              AppAssets.driverIcon,
              () {
                ref.read(localDataProvider).saveUserType("driver");
                context.pushNamed(SignUp.name);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _getTile(String title, String iconPath, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      dense: true,
      contentPadding: const EdgeInsets.all(14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      visualDensity: VisualDensity.compact,
      tileColor: AppColors.primaryWhite,
      title: OnestText(
        "Continue as $title",
        color: AppColors.lightBlack,
        size: 16,
        fontWeight: FontWeight.w500,
      ),
      trailing: const CircleAvatar(
        backgroundColor: AppColors.primaryBlue,
        radius: 9.5,
        child: Center(
          child: Icon(
            CupertinoIcons.arrow_right,
            size: 12,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
      leading: SvgPicture.asset(
        iconPath,
      ),
    );
  }
}
