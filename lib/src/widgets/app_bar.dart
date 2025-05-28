import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/widgets/icon_box.dart';
import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title = "",
    this.titleIcon = AppAssets.logo,
    this.shouldShowLeading = false,
    this.onTap,
    this.leadingIcon = "",
  });
  final String title;
  final String titleIcon;
  final bool shouldShowLeading;
  final void Function()? onTap;
  final String leadingIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      leading: !shouldShowLeading
          ? null
          : IconBox(
              shouldShowBorder: true,
              margin: EdgeInsets.only(left: 20),
              color: AppColors.bgWhite,
              icon: leadingIcon,
            ),
      centerTitle: true,
      title: title != ""
          ? InterTightText(
              title,
              fontWeight: FontWeight.w500,
              size: 16,
            )
          : SvgPicture.asset(
              titleIcon,
            ),
      // actions: [
      //   Row(
      //     children: [
      //       GestureDetector(
      //         onTap: onTap,
      //         // child: IconBox(icon: )
      //       ),
      //     ],
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
