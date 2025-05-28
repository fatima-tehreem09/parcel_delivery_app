import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/card.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/my_assets.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/transactions.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/action_tile.dart';

class Home extends ConsumerStatefulWidget {
  const Home.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/Home';
  static const name = "Home";

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingIcon: AppAssets.menuIcon,
        shouldShowLeading: true,
        titleIcon: AppAssets.assessmentLogo,
      ),
      backgroundColor: AppColors.bgWhite,
      body: CustomScrollView(
        slivers: [
          const CardWidget().sliverPadding,
          12.height.sliver,
          const ActionTile(title: "My Assets", buttonText: "View All")
              .sliverPadding,
          const MyAssets().sliver,
          12.height.sliver,
          const ActionTile(title: "Transactions", buttonText: "View All")
              .sliverPadding,
          const Transactions().sliverPadding,
        ],
      ),
    );
  }
}
