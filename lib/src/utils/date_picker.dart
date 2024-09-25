import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              datePickerTheme: DatePickerThemeData(
                backgroundColor: Colors.white,
                dividerColor: Colors.transparent,
                dayStyle: GoogleFonts.onest(
                  color: AppColors.primaryBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                // todayBackgroundColor:
                //     WidgetStateProperty.all(AppColors.primaryBlue),
                // headerBackgroundColor: AppColors.primaryRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              colorScheme: ColorScheme.light(
                primary: AppColors.primaryScaffoldBg,
                onPrimary: AppColors.primaryBlue,
                onSurface: AppColors.primaryBlack,
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
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly);

    if (picked != null) {
      print('==DP==');
      print(picked);
      onDateSelected(picked);
    }
  }
}
