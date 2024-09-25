import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddTag extends ConsumerStatefulWidget {
  const AddTag.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "/add_tag";
  static const name = "add_tag";

  @override
  ConsumerState createState() => _AddTagState();
}

class _AddTagState extends ConsumerState<AddTag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(title: "Create Tag"),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
