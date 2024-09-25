import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/features/profile/views/add_payment_method.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/local/local_storage_repository.dart';

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
    print("isDriver: $isDriver  ");
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: AppBarWidget(
        title: "Payment Management",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: AppColors.primaryBlue,
              ),
              onPressed: () => context.pushNamed(AddPaymentMethod.name),
              child: OnestText(
                "Add Payment Method",
                color: Color(0xff1AA7B4),
                size: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
