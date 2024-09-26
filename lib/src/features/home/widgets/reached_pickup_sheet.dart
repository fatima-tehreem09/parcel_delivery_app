import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/pickup_dialog.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/sheet_layout.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/tag_delivered_dialog.dart';
import 'package:abiola_along_client_app/src/features/tag/widgets/action_tag_button.dart';
import 'package:abiola_along_client_app/src/features/tag/widgets/courier_info.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:abiola_along_client_app/src/widgets/primary_white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/assets.dart';
import '../../../const/colors.dart';
import '../../../widgets/icon_box.dart';
import '../../../widgets/text_widget.dart';
import '../../tag/widgets/status_tag.dart';

class ReachedPickupSheet extends ConsumerStatefulWidget {
  const ReachedPickupSheet({
    super.key,
    this.isTagDelivered = false,
  });
  final bool isTagDelivered;

  @override
  ConsumerState createState() => _ReachedPickupSheetState();
}

class _ReachedPickupSheetState extends ConsumerState<ReachedPickupSheet> {
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
        PrimaryWhiteContainer(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OnestText(
                          "Call Tag Owner",
                          size: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff15171C),
                        ),
                        OnestText(
                          "Coffee Packet",
                          size: 14,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          color: AppColors.hintDarkGrey,
                        ),
                      ],
                    ),
                  ),
                  const IconBox(
                      color: Color(0xffEFF6FF), icon: AppAssets.messageIcon),
                  10.widthBox,
                  const IconBox(
                      color: Color(0xffECFDF5), icon: AppAssets.phoneIcon),
                ],
              ),
              const Divider(
                height: 20,
                color: Color(0xffE5E7EB),
              ),
              const StatusRow(
                text: "Status",
                isStatus: true,
                statusWidget: StatusTag(
                  text: "In Progress",
                  textColor: Color(0xffF59E0B),
                  boxColor: Color(0xffFFFBEB),
                ),
              ),
              const StatusRow(
                text: "Pickup Point",
                desc: "7529 E. Pecan St.",
              ),
            ],
          ),
        ),
        30.heightBox,
        AppButton(
            onPressed: () {
              if (widget.isTagDelivered) {
                TagDeliveredDialog().show(context);
              } else {
                const PickupDialog().show(context);
              }
            },
            text: widget.isTagDelivered
                ? "Tag Delivered"
                : "Reached At Pickup Point"),
        16.heightBox,
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ActionTagButton(onPressed: () {}, text: "Cancel"),
          ),
        ),
      ],
    );
  }
}
