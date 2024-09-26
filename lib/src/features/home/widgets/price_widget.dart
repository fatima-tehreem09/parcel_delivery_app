import 'package:abiola_along_client_app/src/features/tag/widgets/status_tag.dart';
import 'package:abiola_along_client_app/src/utils/number_refactor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PriceWidget extends ConsumerWidget {
  const PriceWidget({
    super.key,
    required this.price,
  });
  final int price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: StatusTag(
        text: "\$${ref.watch(numberFactorProvider).formatPrice(price)}",
        textColor: const Color(0xffFF7400),
        boxColor: const Color(0xffFFF4EB),
        fontSize: 14,
      ),
    );
  }
}
