import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/assets.dart';

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
    this.suffixIcon,
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
  final Widget? suffixIcon;
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
    final decoration = Theme.of(context).inputDecorationTheme;
    final theme = Theme.of(context);
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: _value,
      isDense: true,
      onSaved: widget.onSaved,
      validator: widget.validator,
      padding: EdgeInsets.zero,
      // iconSize: 0,
      icon: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SvgPicture.asset(AppAssets.dropDownIcon),
      ),

      style: theme.primaryTextTheme.titleSmall,
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.hint ?? '',
          style: decoration.hintStyle,
        ),
      ),
      decoration: InputDecoration(
        isDense: true,

        // prefix: widget.prefix == null
        //     ? const SizedBox()
        //     : Text(
        //   widget.prefix!,
        //   style: GoogleFonts.lato(
        //     color: Colors.black,
        //     fontWeight: FontWeight.w500,
        //     fontSize: 21,
        //   ),
        // ),
        // suffixIcon: widget.suffixIcon,
        filled: decoration.filled,
        // suffixIcon: widget.suffixIcon,
        fillColor: decoration.fillColor,
        border: decoration.border,
        // counterText: widget.counterText,
        enabledBorder: decoration.enabledBorder,
        focusedBorder: decoration.focusedBorder,
        labelText: widget.label,
        // hintText: widget.hint,
        contentPadding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        // hintStyle: decoration.hintStyle,
        suffixIconColor: decoration.suffixIconColor,
        iconColor: decoration.iconColor,
        labelStyle: GoogleFonts.poppins(
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),

      items: widget.dynamicValues
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                widget.builder != null ? widget.builder!(e) : e.toString(),
                style: theme.primaryTextTheme.titleSmall,
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
