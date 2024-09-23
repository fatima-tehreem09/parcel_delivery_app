import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/profile/widgets/edit_button.dart';
import 'package:abiola_along_client_app/src/features/profile/widgets/property_tile.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/inter_text.dart';
import 'package:abiola_along_client_app/src/widgets/primary_white_container.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerStatefulWidget {
  ProfileView.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  }) : isDriver = state.uri.queryParameters['isDriver'] == 'false';

  static const path = "/profile";
  static const name = "profile";

  final bool isDriver;

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  bool get isDriver => widget.isDriver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Profile",
        isHome: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            if (!isDriver)
              PrimaryWhiteContainer(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InterText(
                      "Your Total Earning:",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff15171C),
                    ),
                    12.widthBox,
                    InterText(
                      "\$ 45434.34",
                      size: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff15171C),
                    ),
                  ],
                ),
              ),
            PrimaryWhiteContainer(
              padding: const EdgeInsets.fromLTRB(22, 14, 18, 14),
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 53,
                    height: 53,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(52),
                      child: Image.network(
                        'https://plus.unsplash.com/premium_photo-1677560517139-1836389bf843?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  13.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OnestText(
                          "Brooklyn Simmons",
                          size: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff15171C),
                        ),
                        InterText(
                          "@brooklyn_simmons",
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.hintDarkGrey,
                        ),
                      ],
                    ),
                  ),
                  EditButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            PrimaryWhiteContainer(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  PropertyTile(
                    isDriver: !isDriver,
                    assetName: AppAssets.profileSwitch,
                    actionHeading: "Profile Switch",
                    showSubHeading: true,
                    actionSubHeading: "Switch to Driver Profile",
                  ),
                  if (isDriver) ...[
                    25.heightBox,
                    const PropertyTile(
                      assetName: AppAssets.walletIcon,
                      actionHeading: "Payment Management",
                      showSubHeading: true,
                      actionSubHeading: "Manage your payments",
                    ),
                  ],
                  25.heightBox,
                  PropertyTile(
                    isDriver: !isDriver,
                    assetName: AppAssets.changePasswordIcon,
                    actionHeading: "Change Password",
                    showSubHeading: true,
                    actionSubHeading: "Change your password",
                  ),
                ],
              ),
            ),
            PrimaryWhiteContainer(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  PropertyTile(
                    isDriver: !isDriver,
                    assetName: AppAssets.helpSupportIcon,
                    actionHeading: "Help & Support",
                  ),
                  25.heightBox,
                  PropertyTile(
                    isDriver: !isDriver,
                    assetName: AppAssets.logoutIcon,
                    actionHeading: "Logout",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
