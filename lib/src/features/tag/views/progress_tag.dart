import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/features/tag/widgets/courier_info.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/primary_white_container.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
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
    final _ = ref.watch(localDataProvider);
    final bool isDelivered = _.getTagProgress == "delivered";
    print("isDelivered: $isDelivered");
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(title: "Tag Details"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            PrimaryWhiteContainer(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  CourierInfo(),
                ],
              ),
            ),
            PrimaryWhiteContainer(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  getRow("Tag", "Walnut Workstation"),
                  getRow("Dimension", "50” X 70”"),
                  getRow("Notes", "Wooden"),
                  getRow("Package Size", "20kg"),
                  getRow("Delivery Time", "Urgent"),
                  getRow("Sender Point", "7529 E. Pecan St."),
                  getRow("Receiver Point", "7529 E. Pecan St."),
                  getRow("Total Distance", "5.2 km"),
                  getRow("Delivery Fare", "\$20"),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  "https://plus.unsplash.com/premium_vector-1721289859111-870a76649cba?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            ),
          ],
        ),
      ),
    );
  }

  Column getRow(String text, String info) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OnestText(
              text,
              size: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff15171C),
            ),
            OnestText(
              info,
              size: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.hintDarkGrey,
            ),
          ],
        ),
        Divider(
          height: 22,
          color: Color(
            0xffF3F4F6,
          ),
        ),
      ],
    );
  }
}
