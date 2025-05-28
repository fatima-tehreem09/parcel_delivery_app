import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneralHeading extends ConsumerWidget {
  const GeneralHeading({
    super.key,
    this.heading = "Let’s Get You Started",
    this.subheading =
        "Sign up to manage your crypto and convert it to fiat anytime, anywhere.",
    this.subHeadingMaxLine,
    this.headingMaxLine,
  });
  final String heading;
  final String subheading;
  final int? subHeadingMaxLine;
  final int? headingMaxLine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InterTightText(
          heading,
          maxLines: headingMaxLine,
          color: AppColors.blackSecondary,
          fontWeight: FontWeight.w600,
          size: 20,
        ),
        8.height,
        InterTightText(
          textAlign: TextAlign.center,
          subheading,
          maxLines: subHeadingMaxLine,
          color: AppColors.greyPrimary,
          fontWeight: FontWeight.w400,
          size: 14,
        ),
        24.height,
      ],
    );
  }
}
