import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnestText extends Text {
  OnestText(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color color = AppColors.primaryBlack,
    double size = 14.0,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
          textDirection: TextDirection.ltr,
          style: GoogleFonts.onest(
            color: color,
            fontSize: size,
            decoration: decoration,
            decorationColor: color,
            fontWeight: fontWeight,
          ).copyWith(
            overflow: textOverflow,
          ),
        );
}
