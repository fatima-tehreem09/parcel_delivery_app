import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/profile/views/add_payment_method.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../const/colors.dart';
import '../../../core/local/local_storage_repository.dart';
import '../../../widgets/text_widget.dart';

class PaymentMethod extends ConsumerStatefulWidget {
  const PaymentMethod.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = 'payment-method';
  static const name = 'PaymentMethod';

  @override
  ConsumerState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends ConsumerState<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    final cardNumber = _.getCardNumber;
    print("isDriver: $isDriver  ");
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Payment Management",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            if (cardNumber.isEmpty)
              TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: AppColors.primaryBlue,
                ),
                onPressed: () => context.pushNamed(AddPaymentMethod.name),
                child: OnestText(
                  "Add Payment Method",
                  color: const Color(0xff1AA7B4),
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (cardNumber.isNotEmpty) ...[
              20.heightBox,
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(AppAssets.masterCardIcon),
                ),
                title: OnestText(
                  "Master Card",
                  color: const Color(0xff010101),
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: OnestText(
                  maskCardNumber(cardNumber),
                  color: AppColors.hintDarkGrey,
                  size: 12,
                  fontWeight: FontWeight.w400,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    deleteCard();
                    ref.refresh(localDataProvider);
                  },
                  child: const Icon(
                    CupertinoIcons.delete_solid,
                    color: Color(0xffEB5545),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Future<void> deleteCard() async {
    final data = ref.watch(localDataProvider);
    final delete = ref.read(localDataProvider);
    delete.removeCardHolderName(data.getCardHolderName);
    delete.removeCardNumber(data.getCardNumber);
    delete.removeExpiry(data.getExpiry);
    delete.removeCvv(data.getCvv);
  }

  String maskCardNumber(String cardNumber) {
    if (cardNumber.length < 4) return cardNumber;
    final start = cardNumber.substring(0, 2);
    final end = cardNumber.substring(cardNumber.length - 2);
    final masked = '*' * (cardNumber.length - 6);
    return '$start$masked$end';
  }
}
