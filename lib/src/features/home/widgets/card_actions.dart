import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/icon_box.dart';
import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardActions extends ConsumerWidget {
  const CardActions({super.key});

  final List<String> actions = const [
    "Deposit",
    "Send",
    "Convert",
    "Withdraw",
  ];
  final List<String> icons = const [
    AppAssets.depositIcon,
    AppAssets.sendIcon,
    AppAssets.convertIcon,
    AppAssets.withdrawIcon,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff002620),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ...List.generate(
            4,
            (index) => Expanded(
              child: Column(
                children: [
                  IconBox(
                    height: 44,
                    width: 44,
                    isPng: true,
                    icon: icons[index],
                  ),
                  4.height,
                  InterTightText(
                    actions[index],
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.bgWhite,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
