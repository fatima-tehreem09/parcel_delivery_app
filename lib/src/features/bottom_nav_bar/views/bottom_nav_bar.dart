import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/local/local_storage_repository.dart';

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
    // ref.refresh(localDataProvider);
    final _ = ref.watch(localDataProvider);
    final bool isDriver = _.getUserType == "driver";
    print("isDriver on bbbb"
        ": $isDriver  ");

    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      extendBodyBehindAppBar: isDriver ? true : false,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.homeGrey,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.homeBlack,
                fit: BoxFit.scaleDown,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.tagGrey,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.tagBlack,
                fit: BoxFit.scaleDown,
              ),
              label: '',
            ),
            if (!isDriver)
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.addTag,
                  fit: BoxFit.scaleDown,
                ),
                activeIcon: SvgPicture.asset(
                  AppAssets.addTag,
                  fit: BoxFit.scaleDown,
                ),
                label: '',
              ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.notificationGrey,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.notificationBlack,
                fit: BoxFit.scaleDown,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.profileGrey,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.profileBlack,
                fit: BoxFit.scaleDown,
              ),
              label: '',
            ),
          ],
          onTap: (index) => _onTap(context, index),
          currentIndex: widget.navigationShell.currentIndex,
          backgroundColor: AppColors.primaryWhite,
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
