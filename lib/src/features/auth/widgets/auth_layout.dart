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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.paddingOf(context).top + 14.0, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppAssets.logo,
                width: 78,
                fit: BoxFit.cover,
              ),
            ),
            25.heightBox,
            _heading(heading),
            30.heightBox,
            ...formChildren,
          ],
        ),
      ),
    );
  }
}
