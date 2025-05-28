import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/assets.dart';
import '../../../const/colors.dart';
import '../../../widgets/inter_tight_text.dart';
import 'card_actions.dart';

class CardWidget extends ConsumerWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.greenPrimary,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SvgPicture.asset(AppAssets.cardPattern),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InterTightText(
                          'Credit',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.bgWhite,
                        ),
                        const Spacer(),
                        SvgPicture.asset(AppAssets.visaLogo),
                      ],
                    ),
                    33.height,
                    InterTightText(
                      '\$1,250.00',
                      size: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.bgWhite,
                    ),
                    Row(
                      children: [
                        InterTightText(
                          'Available Balance',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.bgWhite,
                        ),
                        const Spacer(),
                        InterTightText(
                          'Available Balance',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.bgWhite,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              16.height,
              const CardActions(),
            ],
          ),
        ],
      ),
    );
  }
}
