import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/icon_box.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.isHome = false,
    this.isHomeView = false,
  });
  final String title;
  final bool isHome;
  final bool isHomeView;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.brown,
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        leading: isHome
            ? null
            : isHomeView
                ? IconBox(
                    color: Color(0xffECFDF5), icon: AppAssets.locationIcon)
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
        title: isHomeView
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OnestText(
                    "Location",
                    size: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintDarkGrey,
                  ),
                  5.heightBox,
                  OnestText(
                    "Washington DC, USA",
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff15171C),
                  ),
                ],
              )
            : OnestText(
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
