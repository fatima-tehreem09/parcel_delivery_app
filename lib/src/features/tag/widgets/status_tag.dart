import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusTag extends ConsumerWidget {
  const StatusTag({
    super.key,
    required this.text,
    required this.textColor,
    required this.boxColor,
    this.fontSize = 12,
  });
  final Color textColor;
  final Color boxColor;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: boxColor,
      ),
      child: Center(
        child: OnestText(
          maxLines: 1,
          // textOverflow: TextOverflow.ellipsis,
          text,
          size: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
