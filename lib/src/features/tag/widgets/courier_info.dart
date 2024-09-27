import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/tag/widgets/status_tag.dart';
import 'package:abiola_along_client_app/src/widgets/icon_box.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../call_view.dart';
import '../../message_view.dart';

class CourierInfo extends ConsumerWidget {
  const CourierInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(localDataProvider).getUserType;
    bool isDriver = _.contains("driver");
    final __ = ref.watch(localDataProvider);
    final bool isDelivered = __.getTagProgress == "delivered";

    return Column(
      children: [
        if (!isDelivered) ...[
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
                      isDriver ? "Call Tag Owner" : "Call a Courier",
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
              GestureDetector(
                onTap: () => context.pushNamed(MessageView.name),
                child: const IconBox(
                    color: Color(0xffEFF6FF), icon: AppAssets.messageIcon),
              ),
              10.widthBox,
              GestureDetector(
                onTap: () => context.pushNamed(CallView.name),
                child: const IconBox(
                    color: Color(0xffECFDF5), icon: AppAssets.phoneIcon),
              ),
            ],
          ),
          const Divider(
            height: 20,
            color: Color(0xffE5E7EB),
          ),
        ],
        StatusRow(
          text: "Status",
          isStatus: true,
          statusWidget: StatusTag(
            text: isDelivered ? "Delivered" : "In Progress",
            textColor:
                isDelivered ? const Color(0xff059669) : const Color(0xffF59E0B),
            boxColor:
                isDelivered ? const Color(0xffECFDF5) : const Color(0xffFFFBEB),
          ),
        ),
        StatusRow(
          text: isDelivered ? "Delivered On" : "Pickup Time",
          desc: isDelivered ? "02:00PM, 20 July 24" : "10:00 AM",
          bottom: 0,
        ),
        if (isDelivered && isDriver)
          StatusRow(
            text: "Review",
            desc: " (3.4)",
            ratingStar: SvgPicture.asset(
              AppAssets.starIcon,
              width: 16,
              height: 16,
              fit: BoxFit.scaleDown,
            ),
          ),
      ],
    );
  }
}

class StatusRow extends StatelessWidget {
  const StatusRow({
    super.key,
    required this.text,
    this.isStatus = false,
    this.statusWidget = const SizedBox(),
    this.ratingStar = const SizedBox(),
    this.desc = "",
    this.bottom,
  });
  final String text;
  final String desc;
  final bool isStatus;
  final double? bottom;
  final Widget statusWidget;
  final Widget ratingStar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom ?? 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnestText(
            text,
            fontWeight: FontWeight.w500,
            size: 16,
            color: const Color(0xff15171C),
          ),
          if (isStatus)
            statusWidget
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ratingStar,
                OnestText(
                  desc,
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintDarkGrey,
                ),
              ],
            )
        ],
      ),
    );
  }
}
