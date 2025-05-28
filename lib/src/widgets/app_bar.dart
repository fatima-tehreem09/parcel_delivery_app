import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/cached_image.dart';
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
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      leading: !shouldShowLeading
          ? null
          : IconBox(
              shouldShowBorder: true,
              margin: const EdgeInsets.only(left: 20),
              color: AppColors.bgWhite,
              icon: leadingIcon,
            ),
      centerTitle: true,
      title: title.isNotEmpty
          ? InterTightText(
              title,
              fontWeight: FontWeight.w500,
              size: 16,
            )
          : SvgPicture.asset(
              titleIcon,
              fit: BoxFit.scaleDown,
              height: 28,
            ),
      actions: [
        if (title.isEmpty) ...[
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: const IconBox(
                  shouldShowBorder: true,
                  icon: AppAssets.notificationIcon,
                  margin: EdgeInsets.only(right: 8),
                ),
              ),
              const CachedImageWidget(
                size: 40,
                fit: BoxFit.cover,
                url:
                    "https://images.unsplash.com/photo-1623227413711-25ee4388dae3?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
              8.width,
            ],
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
