import 'package:abiola_along_client_app/src/widgets/primary_white_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/colors.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.controller,
    required this.tabs,
  });

  final TabController controller;
  final List<Tab> tabs;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
      borderRadius: 100,
      padding: const EdgeInsets.all(5),
      child: TabBar(
        // tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        // isScrollable: true,
        splashBorderRadius: BorderRadius.circular(0),
        indicatorPadding: EdgeInsets.zero,
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        controller: widget.controller,
        indicator: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(100),
        ),
        unselectedLabelColor: const Color(0xff4B5563),
        splashFactory: NoSplash.splashFactory,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        unselectedLabelStyle: GoogleFonts.onest(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xff4B5563),
        ),
        labelStyle: GoogleFonts.onest(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryWhite,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.primaryWhite,
        onTap: (w) {
          setState(() {});
        },
        tabs: widget.tabs.map((Tab tab) {
          return tab;
        }).toList(),
      ),
    );
  }
}
