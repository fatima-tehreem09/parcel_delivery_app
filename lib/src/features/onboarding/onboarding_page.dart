import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/extensions/size_extension.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign_in/sign_in_view.dart';
import 'package:abiola_along_client_app/src/features/auth/widgets/helper_text.dart';
import 'package:abiola_along_client_app/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../const/colors.dart';
import '../../widgets/inter_tight_text.dart';
import '../auth/views/sign_up/views/sign_up_view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static String path = '/onboarding';
  static const String name = 'onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> imageUrls = [
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
  ];

  final List<String> descriptions = [
    "Your identity is safe with advanced encryption and compliant KYC verification.",
    "Withdraw your crypto in local currency anytime. Fast, easy, secure.",
    "Buy, store, and convert crypto securely allin one place.",
  ];

  final List<String> titles = [
    "Discover Fiacto: Your Ultimate Crypto Wallet Solution",
    "Instantly Convert Crypto to Fiat with Ease",
    "Secure and KYC-Verified for Your Peace of Mind",
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.assessmentLogo,
                fit: BoxFit.scaleDown,
                height: 34,
              ),
              31.54.height,
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: imageUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          imageUrls[index],
                        ),
                        40.height,
                        InterTightText(
                          textAlign: TextAlign.center,
                          size: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackPrimary,
                          titles[index],
                        ),
                        8.height,
                        InterTightText(
                          textAlign: TextAlign.center,
                          size: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyPrimary,
                          descriptions[index],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildDots(),
              ),
              85.height,
              AppButton(
                text: "Login",
                onPressed: () async {
                  if (_currentPage != 2) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    return;
                  }
                  context.goNamed(SignInView.name);
                  // await AppData.setIsFuse();
                  // AppNavigation.to(AppPages.signIn);
                },
              ),
              12.height,
              HelperText(
                text: "New to Fiacto? ",
                linkText: "Sign Up",
                onTap: () {
                  context.goNamed(SignUpView.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < imageUrls.length; i++) {
      dots.add(_buildDot(i));
    }
    return dots;
  }

  Widget _buildDot(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      },
      child: Container(
        width: 24,
        height: 6,
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _currentPage == index
              ? AppColors.greenPrimary
              : AppColors.greyPrimary,
        ),
      ),
    );
  }
}
