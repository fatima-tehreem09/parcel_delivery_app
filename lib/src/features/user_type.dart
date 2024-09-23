import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class UserType extends StatelessWidget {
  const UserType.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/user_type';
  static const name = 'UserType';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.paddingOf(context).top + 14.0),
              child: Image.asset(
                AppAssets.logo,
                width: 78,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            _getTile("User", AppAssets.userIcon),
            20.heightBox,
            _getTile("Driver", AppAssets.driverIcon),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _getTile(String title, String iconPath) {
    return ListTile(
      contentPadding: const EdgeInsets.all(14),
      style: ListTileStyle.drawer,
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
      trailing: SvgPicture.asset(
        AppAssets.forwardColoredIcon,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      ),
      leading: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      ),
    );
  }
}
