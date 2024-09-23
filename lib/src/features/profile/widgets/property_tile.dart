import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/widgets/inter_text.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyTile extends StatelessWidget {
  const PropertyTile({
    super.key,
    required this.assetName,
    required this.actionHeading,
    this.actionSubHeading = '',
    this.showSubHeading = false,
    this.isDriver = false,
  });
  final String assetName;
  final String actionHeading;
  final String actionSubHeading;
  final bool showSubHeading;
  final bool isDriver;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration:
              BoxDecoration(color: Color(0xffEFF6FF), shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              assetName,
              width: 20,
              height: 20,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  isDriver ? AppColors.primaryBlue : Color(0xff1364FF),
                  BlendMode.srcIn),
            ),
          ),
        ),
        16.widthBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              OnestText(
                actionHeading,
                size: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff171718),
              ),
              if (showSubHeading)
                InterText(
                  actionSubHeading,
                  size: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintDarkGrey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
