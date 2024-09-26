import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/widgets/icon_box.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourierInfo extends ConsumerWidget {
  const CourierInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(localDataProvider).getUserType;
    bool isDriver = _.contains("driver");

    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                OnestText(
                  isDriver ? "Call Tag Owner" : "Call a Courier",
                  size: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff15171C),
                ),
                OnestText(
                  "#15171C",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintDarkGrey,
                ),
              ],
            ),
            IconBox(color: Color(0xffEFF6FF), icon: AppAssets.messageIcon),
            IconBox(color: Color(0xffECFDF5), icon: AppAssets.phoneIcon),
          ],
        ),
        Divider(
          color: Color(0xffE5E7EB),
        ),
        Row(
          children: [
            getText("Status"),
          ],
        ),
      ],
    );
  }

  Text getText(String text) {
    return OnestText(
      text,
      fontWeight: FontWeight.w500,
      size: 16,
      color: Color(0xff15171C),
    );
  }
}
