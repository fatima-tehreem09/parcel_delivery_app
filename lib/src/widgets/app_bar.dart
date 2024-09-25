import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.isHome = false,
  });
  final String title;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.brown,
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: isHome
            ? null
            : IconButton(
                icon: SvgPicture.asset(
                  AppAssets.backArrowIcon,
                  // fit: BoxFit.scaleDown,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
        centerTitle: false,
        title: OnestText(
          title,
          size: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
