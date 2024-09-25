import 'package:abiola_along_client_app/src/utils/number_refactor.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
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
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xffFFF4EB),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: OnestText(
            "\$${ref.watch(numberFactorProvider).formatPrice(price)}",
            maxLines: 1,
            // textOverflow: TextOverflow.ellipsis,
            color: Color(0xffFF7400),
            size: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
