import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/email_verification_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/reusables.dart';

import '../../../const/colors.dart';
import '../../../core/local/local_storage_repository.dart';
import '../../../utils/date_picker.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/app_textfield.dart';
import '../../auth/widgets/field_heading.dart';

class AddPaymentMethod extends ConsumerStatefulWidget {
  const AddPaymentMethod.builder(BuildContext context, GoRouterState state,
      {super.key});

  static const path = 'add-payment-method';
  static const name = 'AddPaymentMethod';

  @override
  ConsumerState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends ConsumerState<AddPaymentMethod>
    with FormStateMixin {
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver: $isDriver  ");
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Payment Method",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldHeading(
                text: "Card Holder Name",
              ),
              AppTextField(
                textEditingController: _cardHolderNameController,
                hint: "Itunuoluwa Abidoye",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.go,
                validator: InputValidator.required(),
                onFieldSubmitted: (value) {
                  final bbb =
                      _.saveCardHolderName(_cardHolderNameController.text);
                  print("bbb: $bbb");
                },
              ),
              const FieldHeading(
                text: "Card Number",
              ),
              AppTextField(
                textEditingController: _cardNumberController,
                hint: "1234 3234 2388 2372",
                keyboardType: TextInputType.number,
                validator: InputValidator.required(),
                onFieldSubmitted: (value) {
                  final bbb = _.saveCardNumber(_cardNumberController.text);
                  print("bbb: $bbb");
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textInputAction: TextInputAction.go,
              ),
              const FieldHeading(
                text: "CVV",
              ),
              AppTextField(
                textEditingController: _cvvController,
                hint: "225",
                validator: InputValidator.required(),
                onFieldSubmitted: (value) {
                  final bbb = _.saveCvv(_cvvController.text);
                  print("bbb: $bbb");
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textInputAction: TextInputAction.go,
              ),
              const FieldHeading(
                text: "Expiry",
              ),
              AppTextField(
                textEditingController: _expiryDateController,
                hint: "24/24",
                keyboardType: TextInputType.datetime,
                readOnly: true,
                validator: InputValidator.required(),
                onFieldSubmitted: (value) {
                  final bbb = _.saveCardHolderName(_expiryDateController.text);
                  print("bbb: $bbb");
                },
                onTap: () => DatePickerUtil.dateSelection(
                  context,
                  onDateSelected: (date) {
                    selectedDate = date;
                    _expiryDateController.text =
                        "${date.month}/${date.year.toString().substring(2)}";
                  },
                  selectedDate: selectedDate,
                ),
                textInputAction: TextInputAction.go,
              ),
              50.heightBox,
              AppButton(
                  isLoading: false,
                  onPressed: () {
                    submitter();
                  },
                  text: "Verify"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onSubmit() async {
    final data = ref.read(localDataProvider);
    data.saveCardHolderName(_cardHolderNameController.text);
    data.saveCardNumber(_cardNumberController.text);
    data.saveCvv(_cvvController.text);
    data.saveExpiry(_expiryDateController.text);
    const VerificationDialog(
      isPaymentMethodVerification: true,
    ).show(context);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        context.pop();
        context.pop();
      },
    );
  }
}
