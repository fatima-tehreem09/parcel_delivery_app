import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/features/notification/widgets/icon_container.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../const/assets.dart';

class NotificationView extends ConsumerStatefulWidget {
  const NotificationView.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/notification';
  static const name = 'NotificationView';

  @override
  ConsumerState createState() => _NotificationViewState();
}

class _NotificationViewState extends ConsumerState<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(
        title: "Notifications",
        isHome: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          children: [
            NotificationTile(
              assetName: AppAssets.yellowTruckIcon,
              heading: "Glass Study Table ",
              subHeading: "Package is delivered",
              date: "5 hours ago",
            ),
            NotificationTile(
              assetName: AppAssets.redCancelIcon,
              heading: "Glass Study Table",
              subHeading: "Package is delivered",
              date: "5 hours ago",
            ),
            NotificationTile(
              assetName: AppAssets.greenTick,
              heading: "Glass Study Table",
              subHeading: "Package is delivered",
              date: "5 hours ago",
            ),
          ],
        ),
      ),
    );
  }
}
