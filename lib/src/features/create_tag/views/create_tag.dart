import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/app_bar.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/email_verification_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:abiola_along_client_app/src/widgets/primary_white_container.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateTag extends ConsumerStatefulWidget {
  const CreateTag.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = "create_tag";
  static const name = "create_tag";

  @override
  ConsumerState createState() => _CreateTagState();
}

class _CreateTagState extends ConsumerState<CreateTag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(title: "Create Tag"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const PrimaryWhiteContainer(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  BuildRow(property: "Tag", desc: "Coffee Packet"),
                  BuildRow(property: "Dimension", desc: "10 x 10 x 10"),
                  BuildRow(property: "Notes", desc: "Fragile"),
                  BuildRow(property: "Package Size", desc: "Small"),
                  BuildRow(property: "Delivery Time", desc: "2 days"),
                  BuildRow(property: "Sender Point", desc: "Lagos"),
                  BuildRow(property: "Receiver Point", desc: "Abuja"),
                ],
              ),
            ),
            const BasicRow(
              property: "Delivery Charges:",
              desc: "\$20",
            ),
            20.heightBox,
            const BasicRow(
              property: "Tax(10%):",
              desc: "\$2",
            ),
            const Divider(
              height: 22,
              color: Color(0xffE5E7EB),
            ),
            const BasicRow(
              property: "Total Charges:",
              desc: "\$2",
            ),
            50.heightBox,
            AppButton(
              onPressed: () {
                const VerificationDialog(
                  isPaymentSuccessful: true,
                ).show(context);
              },
              text: "Pay Delivery Charges",
            ),
          ],
        ),
      ),
    );
  }
}

class BuildRow extends StatelessWidget {
  const BuildRow({super.key, required this.property, required this.desc});
  final String property;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicRow(property: property, desc: desc),
        const Divider(
          height: 22,
          color: Color(0xffF3F4F6),
        ),
      ],
    );
  }
}

class BasicRow extends StatelessWidget {
  const BasicRow({super.key, required this.property, required this.desc});
  final String property;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnestText(
          property,
          size: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xff15171C),
        ),
        OnestText(
          desc,
          size: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.hintDarkGrey,
        ),
      ],
    );
  }
}
