import 'package:flutter/material.dart';

import '../shared/app_exception.dart';
import '../widgets/snack_bar/app_snack_bar.dart';

typedef FutureAction = Future<void> Function();

Future<bool> computeAction(BuildContext context, FutureAction future) async {
  try {
    await future();
    return true;
  } catch (e) {
    debugPrint('=-=-=--=-=-');
    debugPrint(e.toString());
    if (!context.mounted) return false;
    var exc = e;
    if (exc is! AppException) {
      exc = AppException.withError(e);
    }
    AppSnackBar.showErrorSnackBar(exc.error);
    return false;
  }
}

Future<T?> performNetworkOperation<T>(
  BuildContext context,
  Future<T> Function() future,
) async {
  try {
    final result = await future();
    return result;
  } catch (e) {
    if (!context.mounted) return null;
    var exc = e;
    if (exc is! AppException) {
      exc = AppException.withError(e);
    }

    AppSnackBar.showErrorSnackBar(
      exc.error,
    );
    return null;
  }
}
