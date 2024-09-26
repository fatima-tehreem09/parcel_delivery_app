import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/primary_white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProgressTag extends ConsumerStatefulWidget {
  const ProgressTag.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "progress-tag";
  static const name = "progress-tag";

  @override
  ConsumerState createState() => _ProgressTagState();
}

class _ProgressTagState extends ConsumerState<ProgressTag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(title: "Tag Details"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            PrimaryWhiteContainer(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
