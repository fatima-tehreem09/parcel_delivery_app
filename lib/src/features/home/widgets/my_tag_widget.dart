import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/price_widget.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/specs_widget.dart';
import 'package:abiola_along_client_app/src/widgets/primary_white_container.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTagWidget extends ConsumerStatefulWidget {
  const MyTagWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  ConsumerState createState() => _MyTagWidgetState();
}

class _MyTagWidgetState extends ConsumerState<MyTagWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      overlayColor: WidgetStateProperty.all(AppColors.primaryWhite),
      borderRadius: BorderRadius.circular(16),
      child: PrimaryWhiteContainer(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OnestText(
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                        "Michael Study Table",
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff15171C),
                      ),
                      // 10.heightBox,
                      OnestText(
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        "wooden",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintDarkGrey,
                      ),
                    ],
                  ),
                ),
                const PriceWidget(
                  price: 2000,
                ),
              ],
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: SpecsWidget(
                      asset: AppAssets.distanceIcon, desc: "${"234567"}"),
                ),
                15.widthBox,
                const Expanded(
                  child: SpecsWidget(
                      asset: AppAssets.weightIcon, desc: "${"234567"}"),
                ),
                15.widthBox,
                const Expanded(
                  child: SpecsWidget(
                      isDay: true,
                      asset: AppAssets.calendarIcon,
                      desc: "Today"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
