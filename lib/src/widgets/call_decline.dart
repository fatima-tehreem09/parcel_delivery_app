import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallDecline extends StatelessWidget {
  const CallDecline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 74,
      decoration: const BoxDecoration(
        color: Color(0xffEB5545),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(AppAssets.callDecline),
      ),
    );
  }
}
