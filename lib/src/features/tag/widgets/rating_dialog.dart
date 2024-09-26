import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/base_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RatingDialog extends ConsumerStatefulWidget {
  const RatingDialog({super.key});

  @override
  ConsumerState createState() => _RatingDialogState();

  Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => this,
        ) ??
        false;
  }
}

class _RatingDialogState extends ConsumerState<RatingDialog> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OnestText(
          "Review & Rating",
          size: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
        10.heightBox,
        OnestText(
          textAlign: TextAlign.center,
          "Your tag has been successfully delivered to the specified address. Please confirm receipt and rate the driver's service.",
          size: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.hintDarkGrey,
        ),
        15.heightBox,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++) ...[
              InkWell(
                onTap: () {
                  setState(() {
                    _currentRating = i + 1;
                  });
                },
                child: SvgPicture.asset(
                  i < _currentRating
                      ? AppAssets.starIcon
                      : AppAssets.starOutlineIcon,
                ),
              ),
              3.widthBox,
            ],
          ],
        ),
        20.heightBox,
        TextButton(
          style: TextButton.styleFrom(
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: const Color(0xff1364FF).withOpacity(0.5),
            minimumSize: Size.zero,
          ),
          onPressed: () {
            context.pop();
          },
          child: OnestText(
            "Confirm Rating",
            color: const Color(0xff1364FF),
            fontWeight: FontWeight.w600,
            size: 16,
          ),
        )
      ],
    );
  }
}
