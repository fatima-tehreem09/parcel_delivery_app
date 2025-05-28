import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/icon_box.dart';
import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAssets extends ConsumerWidget {
  const MyAssets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<String> names = [
      "Bitcoin (BTC)",
      "Ethereum (ETH)",
      "Litecoin (LTC)",
    ];

    const List<String> icons = [
      AppAssets.bitcoinIcon,
      AppAssets.ethereumIcon,
      AppAssets.ethereumIcon,
    ];
    return SizedBox(
      height: 65,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.greySecondary,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: _AssetItem(
              icon: icons[index],
              color:
                  index % 2 == 0 ? AppColors.yellowPrimary : Color(0xffE8E8E8),
              name: names[index],
              amount: '1,250.000',
            ),
          );
        },
      ),
    );
  }
}

class _AssetItem extends StatelessWidget {
  final String icon;
  final Color color;
  final String name;
  final String amount;

  const _AssetItem({
    required this.icon,
    required this.color,
    required this.name,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconBox(
          color: color,
          icon: icon,
        ),
        9.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InterTightText(
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                name,
                size: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrey,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  InterTightText(
                    amount,
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackPrimary,
                  ),
                  25.width,
                  Row(
                    children: [
                      InterTightText(
                        amount,
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greenPrimary,
                      ),
                      SvgPicture.asset(AppAssets.tradeIcon),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
