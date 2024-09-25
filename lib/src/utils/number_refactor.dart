import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberFactorProvider = Provider((_) => NumberRefactor());

class NumberRefactor {
  String formatPrice(int number) {
    if (number >= 1000) {
      double num = number / 1000.0;
      return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}k';
    } else if (number >= 100000) {
      double num = number / 100000.0;
      return '${num.toStringAsFixed(num.truncateToDouble() == num ? 0 : 1)}M';
    } else {
      return number.toString();
    }
  }
}
