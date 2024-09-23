import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(
        title: "Profile",
        isHome: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
