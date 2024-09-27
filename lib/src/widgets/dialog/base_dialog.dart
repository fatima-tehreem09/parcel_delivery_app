import 'dart:math';

import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: min(double.infinity, MediaQuery.of(context).size.width),
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
