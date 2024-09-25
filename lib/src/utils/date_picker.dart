import 'package:flutter/material.dart';

import '../const/colors.dart';

abstract class DatePickerUtil {
  static Future<void> dateSelection(
    BuildContext context, {
    required Function(DateTime) onDateSelected,
    DateTime? selectedDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        final theme = Theme.of(context);
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryScaffoldBg,
              onPrimary: theme.colorScheme.primary,
              onSurface: theme.colorScheme.onSurface,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryBlue,
              ),
            ),
          ),
          child: child!,
        );
      },
      initialDatePickerMode: DatePickerMode.day,
      useRootNavigator: true,
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }
}
