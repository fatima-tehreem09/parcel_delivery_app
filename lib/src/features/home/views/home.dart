import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/local/local_storage_repository.dart';

class Home extends ConsumerStatefulWidget {
  Home.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/home";
  static const name = "home";

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver: $isDriver  ");
    return const Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(
        title: "Home",
        isHome: true,
      ),
    );
  }
}
