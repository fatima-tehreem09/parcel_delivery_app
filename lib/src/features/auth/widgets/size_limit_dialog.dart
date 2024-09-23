import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:surgemate_client_app/src/constants/assets.dart';
import 'package:surgemate_client_app/src/extension/widget_extension.dart';

import '../../../theme/theme_provider/theme_provider.dart';

class SizeLimitDialog extends ConsumerWidget {
  const SizeLimitDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(appThemeProvider);
    bool mode = _ == ThemeMode.dark;
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: mode ? const Color(0xff121825) : const Color(0xffF3F3F3),
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    AppAssets.cancelIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color:
                      mode ? const Color(0xff212C42) : const Color(0xffF8F8FA),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: mode ? const Color(0xff121825) : Colors.white,
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  AppAssets.fileIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              20.height,
              Text(
                "Upload Failed",
                style: theme.primaryTextTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              12.height,
              Text(
                "We are unable to proceed with your image because it’s size is larger than 100MB. It should be less than 100MB.",
                style: theme.primaryTextTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => this,
    );
  }
}
