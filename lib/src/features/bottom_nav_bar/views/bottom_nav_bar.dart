import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/local/local_storage_repository.dart';
import '../../../navigation/app_nav.dart';

class NavigationView extends ConsumerStatefulWidget {
  const NavigationView({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<NavigationView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<NavigationView> {
  @override
  Widget build(BuildContext context) {
    ref.watch(routerConfigProvider);
    ref.watch(localDataProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      extendBodyBehindAppBar: false,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 00.6),
              offset: const Offset(0, -4),
              blurRadius: 8,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 00.4),
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.homeFilledIcon,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.homeFilledIcon,
                fit: BoxFit.scaleDown,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.creditCardInactive,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.creditCardInactive,
                fit: BoxFit.scaleDown,
              ),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.benefitsIcon,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.benefitsIcon,
                fit: BoxFit.scaleDown,
              ),
              label: 'Benefits',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.discoverIcon,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.discoverIcon,
                fit: BoxFit.scaleDown,
              ),
              label: 'Discover',
            ),
          ],
          onTap: (index) => _onTap(context, index),
          currentIndex: widget.navigationShell.currentIndex,
          backgroundColor: AppColors.bgWhite,
          elevation: 0.0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: widget.navigationShell,
    );
  }

  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
