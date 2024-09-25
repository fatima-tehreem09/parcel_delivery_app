import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/assets.dart';
import '../const/colors.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.dynamicValues,
    this.onChanged,
    this.value,
    this.validator,
    this.errorMessage,
    this.builder,
    this.label,
    this.hint,
    this.onSaved,
  });

  final void Function(T?)? onChanged;
  final void Function(T?)? onSaved;
  final String? Function(T?)? validator;
  final String Function(T)? builder;
  final List<T> dynamicValues;
  final String? errorMessage;
  final String? hint;
  final String? label;
  final T? value;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

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

    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: _value,
      isDense: true,
      onSaved: widget.onSaved,
      validator: widget.validator,
      padding: EdgeInsets.zero,
      icon: SizedBox(),
      style: getStyle(AppColors.primaryBlack),
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.hint ?? '',
          style: getStyle(AppColors.hintDarkGrey),
        ),
      ),
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: SvgPicture.asset(
          AppAssets.dropDownIcon,
          fit: BoxFit.scaleDown,
        ),
        filled: true,
        fillColor: AppColors.primaryWhite,
        border: getBorder(AppColors.primaryWhite),
        enabledBorder: getBorder(AppColors.primaryWhite),
        focusedBorder: getBorder(AppColors.primaryBlue),
        labelText: widget.label,
        hintText: widget.hint,
        contentPadding:
            const EdgeInsets.only(left: 20, top: 16, bottom: 18, right: 20),
        hintStyle: getStyle(AppColors.hintDarkGrey),
      ),
      dropdownColor: AppColors.primaryWhite,
      elevation: 0,
      borderRadius: BorderRadius.circular(20),
      items: widget.dynamicValues
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                widget.builder != null ? widget.builder!(e) : e.toString(),
                style: getStyle(AppColors.lightBlack),
              ),
            ),
          )
          .toList(),
      onChanged: (val) {
        _value = val;
        setState(() {});
        if (widget.onChanged != null) {
          widget.onChanged!(val);
        }
      },
    );
  }
}
