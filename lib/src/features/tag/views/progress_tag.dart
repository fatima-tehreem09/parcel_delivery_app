import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/tag/widgets/action_tag_button.dart';
import 'package:abiola_along_client_app/src/features/tag/widgets/courier_info.dart';
import 'package:abiola_along_client_app/src/features/tag/widgets/rating_dialog.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(localDataProvider).getTagProgress == "delivered" &&
          ref.read(localDataProvider).getUserType != "driver") {
        Future.delayed(
          const Duration(seconds: 5),
          () {
            if (!mounted) return;
            const RatingDialog().show(context);
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDelivered = _.getTagProgress == "delivered";
    print("isDelivered: $isDelivered");
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(title: "Tag Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const PrimaryWhiteContainer(
              padding: EdgeInsets.fromLTRB(20, 23, 20, 0),
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  CourierInfo(),
                ],
              ),
            ),
            const PrimaryWhiteContainer(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  getRow(text: "Tag", info: "Walnut Workstation"),
                  getRow(text: "Dimension", info: "50” X 70”"),
                  getRow(text: "Notes", info: "Wooden"),
                  getRow(text: "Package Size", info: "20kg"),
                  getRow(text: "Delivery Time", info: "Urgent"),
                  getRow(text: "Sender Point", info: "7529 E. Pecan St."),
                  getRow(text: "Receiver Point", info: "7529 E. Pecan St."),
                  getRow(text: "Total Distance", info: "5.2 km"),
                  getRow(text: "Delivery Fare", info: "\$20", isLast: true),
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
            30.heightBox,
            ActionTagButton(
              onPressed: () {},
              text: isDelivered ? "Delete" : "Cancel Tag",
            ),
          ],
        ),
      ),
    );
  }

  //
}

class getRow extends StatelessWidget {
  const getRow({
    super.key,
    required this.text,
    required this.info,
    this.isLast = false,
  });
  final String text;
  final String info;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OnestText(
              text,
              size: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xff15171C),
            ),
            OnestText(
              info,
              size: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.hintDarkGrey,
            ),
          ],
        ),
        if (!isLast)
          const Divider(
            height: 22,
            color: Color(
              0xffF3F4F6,
            ),
          ),
      ],
    );
  }
}
