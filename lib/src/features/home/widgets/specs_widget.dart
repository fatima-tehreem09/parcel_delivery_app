import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/number_refactor.dart';

class SpecsWidget extends ConsumerWidget {
  const SpecsWidget({
    super.key,
    required this.desc,
    required this.asset,
    this.isDay = false,
  });
  final String asset;
  final String desc;
  final bool isDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xffF9FAFB),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffF3F4F6),
              width: 1,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              asset,
              width: 16,
              height: 16,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: OnestText(
            isDay
                ? desc
                : ref.watch(numberFactorProvider).formatPrice(
                      int.parse(desc),
                    ),
            size: 14,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
            color: const Color(0xff6B7280),
          ),
        ),
      ],
    );
  }
}
