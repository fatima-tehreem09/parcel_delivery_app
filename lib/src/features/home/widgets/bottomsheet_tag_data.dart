import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/reached_pickup_sheet.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/sheet_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../const/colors.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_white_container.dart';
import '../../../widgets/text_widget.dart';
import '../../tag/views/progress_tag.dart';

class BottomSheetTagData extends ConsumerStatefulWidget {
  const BottomSheetTagData({super.key});

  @override
  ConsumerState createState() => _BottomSheetTagDataState();
}

class _BottomSheetTagDataState extends ConsumerState<BottomSheetTagData> {
  @override
  Widget build(BuildContext context) {
    return SheetLayout(
      children: [
        4.heightBox,
        Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            AppAssets.dragHandle,
            fit: BoxFit.scaleDown,
          ),
        ),
        12.heightBox,
        OnestText(
          "Tag Details",
          size: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
        const AppWhiteContainer(
          margin: EdgeInsets.only(bottom: 10, top: 20),
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
              getRow(
                text: "Delivery Fare",
                info: "\$20",
                isLast: true,
              ),
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
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: AppButton(
            onPressed: () {
              context.pop();
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                builder: (_) {
                  return const ReachedPickupSheet();
                },
              );
            },
            text: "Accept",
          ),
        ),
      ],
    );
  }
}
