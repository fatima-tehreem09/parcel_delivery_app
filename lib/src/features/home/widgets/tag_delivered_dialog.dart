import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/dialog/base_dialog.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class TagDeliveredDialog extends StatelessWidget {
  const TagDeliveredDialog({
    super.key,
  });

  Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => this,
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              context.pop();
              context.pop();
            },
            child: SvgPicture.asset(AppAssets.dialogCancelIcon),
          ),
        ),
        SvgPicture.asset(
          AppAssets.greenTick,
          width: 48,
          height: 48,
        ),
        20.heightBox,
        OnestText(
          "Tag Delivered",
          size: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
        15.heightBox,
        OnestText(
          textAlign: TextAlign.center,
          "Great! You have successfully delivered the tag to the delivery location. Now, let's wait for the tag owner to confirm the delivery shortly.",
          size: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.hintDarkGrey,
        ),
      ],
    );
  }
}
