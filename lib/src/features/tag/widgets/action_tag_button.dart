import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ActionTagButton extends StatelessWidget {
  const ActionTagButton(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Color(0xffEF4444).withOpacity(0.5),
        minimumSize: Size.zero,
      ),
      onPressed: onPressed,
      child: OnestText(
        text,
        color: Color(0xffEF4444),
        fontWeight: FontWeight.w600,
        size: 16,
      ),
    );
  }
}
