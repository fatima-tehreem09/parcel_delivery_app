import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterText extends Text {
  InterText(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color? color,
    double? height,
    double? letterSpacing,
    double? decorationThickness,
    double? size,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
          textDirection: TextDirection.ltr,
          style: GoogleFonts.inter(
                  color: color,
                  fontSize: size,
                  height: height,
                  fontStyle: fontStyle,
                  decoration: decoration,
                  decorationColor: color,
                  letterSpacing: letterSpacing,
                  fontWeight: fontWeight,
                  decorationThickness: decorationThickness)
              .copyWith(
            overflow: textOverflow,
          ),
        );
}
