import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/card.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/my_assets.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/cached_image.dart';
import '../widgets/action_tile.dart';

class Home extends ConsumerStatefulWidget {
  const Home.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/Home';
  static const name = "Home";

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingIcon: AppAssets.menuIcon,
        shouldShowLeading: true,
        titleIcon: AppAssets.assessmentLogo,
      ),
      backgroundColor: AppColors.bgWhite,
      body: CustomScrollView(
        slivers: [
          CardWidget().sliverPadding,
          12.height.sliver,
          const ActionTile(title: "My Assets", buttonText: "View All")
              .sliverPadding,
          const MyAssets().sliver,
          12.height.sliver,
          const ActionTile(title: "Transactions", buttonText: "View All")
              .sliverPadding,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4, // Adjust based on your data
            itemBuilder: (context, index) {
              final transactions = [
                {
                  'name': 'Olivia Brown',
                  'type': 'Incoming Transfer',
                  'amount': '+\$120.00',
                  'date': 'May 28,2025',
                  'isIncoming': true,
                },
                {
                  'name': 'Liam Johnson',
                  'type': 'Outgoing Transfer',
                  'amount': '-\$120.00',
                  'date': 'May 28,2025',
                  'isIncoming': false,
                },
                {
                  'name': 'Emma Thompson',
                  'type': 'Incoming Transfer',
                  'amount': '+\$120.00',
                  'date': 'May 28,2025',
                  'isIncoming': true,
                },
                {
                  'name': 'Noah Smith',
                  'type': 'Outgoing Transfer',
                  'amount': '-\$120.00',
                  'date': 'May 28,2025',
                  'isIncoming': false,
                },
              ];

              final transaction = transactions[index];
              return _TransactionItem(
                name: transaction['name'] as String,
                type: transaction['type'] as String,
                amount: transaction['amount'] as String,
                date: transaction['date'] as String,
                isIncoming: transaction['isIncoming'] as bool,
              );
            },
          ).sliverPadding,
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String name;
  final String type;
  final String amount;
  final String date;
  final bool isIncoming;
  const _TransactionItem({
    required this.name,
    required this.type,
    required this.amount,
    required this.date,
    required this.isIncoming,
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
            url:
                "https://images.unsplash.com/photo-1746655421130-9fba824e19f5?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
                      type,
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
