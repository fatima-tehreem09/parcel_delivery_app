import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/colors.dart';

class RecognizerText extends StatelessWidget {
  const RecognizerText({
    super.key,
    required this.text1,
    required this.text2,
    this.color = AppColors.primaryBlue,
    this.text1Size = 12.0,
    this.text2Size = 12.0,
    this.text1Color = AppColors.textGrey,
    this.text2Weight = FontWeight.w500,
    this.text1Weight = FontWeight.w500,
    this.textDecoration = TextDecoration.none,
    this.recognizer,
    this.alignment = Alignment.bottomCenter,
  });
  final String text1;
  final String text2;
  final Color color;
  final Color text1Color;
  final double text1Size;
  final double text2Size;
  final FontWeight text2Weight;
  final FontWeight text1Weight;
  final TextDecoration textDecoration;
  final GestureRecognizer? recognizer;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: text1,
          style: GoogleFonts.montserrat(
            fontSize: text1Size,
            fontWeight: text1Weight,
            color: text1Color,
            decoration: textDecoration,
          ),
          children: [
            TextSpan(
              text: text2,
              recognizer: recognizer,
              style: GoogleFonts.montserrat(
                fontSize: text2Size,
                fontWeight: text2Weight,
                color: color,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
