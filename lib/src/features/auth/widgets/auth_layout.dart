import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text_widget.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.heading,
    required this.formChildren,
  });

  final String heading;
  final List<Widget> formChildren;

  Text _heading(String heading) {
    return OnestText(
      heading,
      size: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryBlack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      body: Column(
        children: [
          Image.asset(AppAssets.logo),
          30.heightBox,
          _heading(heading),
          50.heightBox,
          ...formChildren,
        ],
      ),
    );
  }
}
