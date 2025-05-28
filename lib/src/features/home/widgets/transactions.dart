import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/providers/transactions/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../const/colors.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/inter_tight_text.dart';

class Transactions extends ConsumerWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(transaction);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final info = data[index];

        return _TransactionItem(
          name: info['name'] as String,
          status: info['status'] as String,
          amount: info['amount'] as String,
          date: info['date'] as String,
          image: info['imageUrl'] as String,
        );
      },
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String name;
  final String status;
  final String amount;
  final String date;
  final String image;

  const _TransactionItem({
    required this.name,
    required this.status,
    required this.amount,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffEBEBEB),
      ),
      child: Row(
        children: [
          CachedImageWidget(
            size: 40,
            url: image,
            fit: BoxFit.cover,
          ),
          9.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InterTightText(
                      name,
                      size: 14,
                      color: AppColors.blackPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    InterTightText(
                      amount,
                      size: 14,
                      fontWeight: FontWeight.w500,
                      // color: isIncoming
                      //     ? AppColors.greenPrimary
                      //     : AppColors.redPrimary,
                    ),
                  ],
                ),
                4.height,
                Row(
                  children: [
                    InterTightText(
                      status,
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                    const Spacer(),
                    InterTightText(
                      date,
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
