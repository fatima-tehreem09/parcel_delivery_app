import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      this.hint,
      this.label,
      this.validator,
      this.keyboardType,
      this.textEditingController,
      this.suffixIcon,
      this.readOnly,
      this.prefix,
      this.obscureText,
      this.onCountryTap,
      BuildContext? context,
      this.onTap,
      this.textFieldUpperText,
      this.onSaved,
      this.onFieldSubmitted,
      this.autofillHints,
      this.initialValue,
      this.maxLines,
      this.maxLength,
      this.counterText,
      this.hintStyle,
      this.borderRadius,
      this.textKey,
      this.onChanged,
      this.inputFormatters,
      this.textInputAction = TextInputAction.done,
      this.bigField = false,
      this.isSearchField = false,
      this.isMessageField = false});

  // final bool obscure;
  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool? readOnly;
  final bool? obscureText;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final VoidCallback? onCountryTap;
  final String? textFieldUpperText;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? initialValue;
  final int? maxLines;
  final int? maxLength;
  final String? counterText;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final Key? textKey;
  final TextInputAction textInputAction;
  final bool bigField;
  final bool isSearchField;
  final bool isMessageField;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    InputBorder getBorder(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.bigField ? 20 : 100),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );
    }

    TextStyle getStyle(Color color) {
      return GoogleFonts.onest(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        decoration: TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.transparent,
        decorationThickness: 0,
      );
    }

    return TextFormField(
      key: widget.textKey,
      readOnly: widget.readOnly ?? false,
      initialValue: widget.initialValue,
      style: getStyle(AppColors.primaryBlack),
      onTap: widget.onTap,
      autofillHints: widget.autofillHints,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.textEditingController,
      onSaved: widget.onSaved,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        prefixIcon: widget.isSearchField
            ? SvgPicture.asset(
                AppAssets.searchIcon,
                fit: BoxFit.scaleDown,
              )
            : widget.prefix,
        prefix: widget.prefix,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: widget.isMessageField
            ? const Color(0xffF8F8FA)
            : AppColors.primaryWhite,
        border: getBorder(widget.isSearchField
            ? const Color(0xffF9FAFB)
            : AppColors.primaryWhite),
        counterText: widget.counterText,
        enabledBorder: getBorder(widget.isSearchField
            ? const Color(0xffF9FAFB)
            : AppColors.primaryWhite),
        focusedBorder: getBorder(widget.isSearchField
            ? const Color(0xffF9FAFB)
            : AppColors.primaryBlue),
        labelText: widget.label,
        hintText: widget.hint,
        contentPadding:
            const EdgeInsets.only(left: 20, top: 16, bottom: 18, right: 20),
        hintStyle: getStyle(AppColors.hintDarkGrey),
        suffixIconColor: Colors.black,
        iconColor: Colors.black,
        // labelStyle: GoogleFonts.poppins(
        //   color: Colors.black.withOpacity(0.4),
        //   fontWeight: FontWeight.w500,
        //   fontSize: 16,
        // ),
      ),
      cursorColor: AppColors.primaryBlue,
    );
  }
}

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.icon,
    this.label,
    this.validator,
    this.hint,
    this.context,
    this.textEditingController,
    this.borderRadius,
    this.textKey,
    this.onChanged,
    this.initialValue,
    this.onSaved,
    this.readOnly=false,
  });

  final IconData? icon;
  final FormFieldSetter<String>? onSaved;
  final String? hint;
  final String? label;
  final BuildContext? context;
  final bool readOnly;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;
  final double? borderRadius;
  final Key? textKey;
  final Function(String)? onChanged;
  final String? initialValue;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    InputBorder getBorder(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );
    }

    TextStyle getStyle(Color color) {
      return GoogleFonts.onest(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        decoration: TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.transparent,
        decorationThickness: 0,
      );
    }

    return TextFormField(
      initialValue: widget.initialValue,
      readOnly: widget.readOnly,
      key: widget.textKey,
      onSaved: widget.onSaved,
      cursorColor: AppColors.primaryBlue,
      validator: widget.validator,
      obscureText: _show,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.textEditingController,
      textInputAction: TextInputAction.done,
      // onFieldSubmitted: (v) {
      //   FocusScope.of(context).nextFocus();
      // },
      style: getStyle(AppColors.primaryBlack),
      scrollPadding: const EdgeInsets.all(180),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          child: Icon(
            color: AppColors.primaryBlue,
            _show ? Icons.visibility_off_sharp : Icons.visibility_sharp,
            size: 24,
          ),
          onTap: () => setState(
            () => _show = !_show,
          ),
        ),
        filled: true,
        fillColor: AppColors.primaryWhite,
        border: getBorder(AppColors.primaryWhite),
        enabledBorder: getBorder(AppColors.primaryWhite),
        focusedBorder: getBorder(AppColors.primaryBlue),

        labelText: widget.label,
        hintStyle: getStyle(AppColors.hintDarkGrey),
        suffixIconColor: AppColors.primaryBlack,
        iconColor: AppColors.primaryBlack,
        contentPadding:
            const EdgeInsets.only(left: 20, top: 16, bottom: 18, right: 20),
        hintText: "************",
        // labelStyle: GoogleFonts.lato(
        //   color: Colors.black.withOpacity(0.4),
        //   fontWeight: FontWeight.w500,
        //   fontSize: 16,
        // ),
      ),
    );
  }
}
