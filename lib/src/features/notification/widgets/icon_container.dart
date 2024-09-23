import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/text_widget.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.assetName});
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: AppColors.primaryWhite,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          assetName,
          fit: BoxFit.cover,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.assetName,
    required this.heading,
    required this.subHeading,
    required this.date,
  });
  final String assetName;
  final String heading;
  final String subHeading;
  final String date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.brown,
      dense: true,

      contentPadding: EdgeInsets.symmetric(vertical: 10),
      leading: IconContainer(assetName: assetName),
      title: OnestText(
        heading,
        color: const Color(0xff010101),
        size: 16,
        fontWeight: FontWeight.w600,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
      isThreeLine: true,
      subtitle: OnestText(
        subHeading,
        maxLines: 2,
        color: AppColors.hintDarkGrey,
        size: 12,
        fontWeight: FontWeight.w400,
      ),
      trailing: OnestText(
        date,
        color: Color(0xff9CA3AF),
        size: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
