import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign_in/sign_in_view.dart';
import 'package:abiola_along_client_app/src/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/views/sign_up/views/sign_up_view.dart';
import '../features/bottom_nav_bar/views/bottom_nav_bar.dart';
import '../features/home/views/home.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final routerConfigProvider = Provider<GoRouter>((ref) {
  final driver = ref.watch(localDataProvider).getUserType == "driver";
  final isUserStored = ref.watch(localDataProvider).getUserType.isNotEmpty;
  final accessToken = ref.watch(localDataProvider).accessToken;
  final branches = <StatefulShellBranch>[
    StatefulShellBranch(
      initialLocation: Home.path,
      routes: <RouteBase>[
        GoRoute(
          path: Home.path,
          name: Home.name,
          builder: Home.builder,
        ),
      ],
    ),
  ];
  print('Total Branches : ${branches.length}');
  return GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: OnboardingPage.path,
    routes: [
      // GoRoute(
      //   path: Splash.path,
      //   name: Splash.name,
      //   builder: Splash.builder,
      // ),
      GoRoute(
        path: OnboardingPage.path,
        name: OnboardingPage.name,
        builder: OnboardingPage.builder,
      ),
      GoRoute(
        path: SignInView.path,
        name: SignInView.name,
        builder: SignInView.builder,
      ),
      GoRoute(
        path: SignUpView.path,
        name: SignUpView.name,
        builder: SignUpView.builder,
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationView(
            navigationShell: navigationShell,
          );
        },
        branches: branches,
      ),
    ],
    // redirect: (_, state) {
    //   final fullPath = state.fullPath;
    //   // final isSplash = fullPath == SplashView.path;
    //   // if (isSplash) {
    //   //   return null;
    //   // }
    //   final token = ref.read(localDataProvider).accessToken;
    //   final isLoggedIn = token != null && token.isNotEmpty;
    //   final isInitialRoute =
    //       fullPath == SignIn.path || fullPath == SignUp.path;
    //   if (isLoggedIn) {
    //     if (isInitialRoute) {
    //       return Home.path;
    //     }
    //     return null;
    //   } else {
    //     if (!isInitialRoute) {
    //       return SignIn.path;
    //     }
    //     return null;
    //   }
    // },
  );
});
