import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/base_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../views/camera.dart';

class PickupDialog extends ConsumerStatefulWidget {
  const PickupDialog({super.key});

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

class _RatingDialogState extends ConsumerState<PickupDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OnestText(
          "Pickup Point",
          size: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
        10.heightBox,
        OnestText(
          textAlign: TextAlign.center,
          "You have arrived at the pickup point. Please take a image of the Tag.",
          size: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.hintDarkGrey,
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
            context.pop();
            context.pushNamed(CameraPage.name);
          },
          child: OnestText(
            "Take Image",
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.w600,
            size: 16,
          ),
        )
      ],
    );
  }
}
