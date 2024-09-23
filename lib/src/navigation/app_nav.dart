import 'package:abiola_along_client_app/src/features/auth/views/forget_password/views/forget_password.dart';
import 'package:abiola_along_client_app/src/features/auth/views/forget_password/views/update_password.dart';
import 'package:abiola_along_client_app/src/features/auth/views/sign-up/views/sign_up.dart';
import 'package:abiola_along_client_app/src/features/bottom_nav_bar/views/bottom_nav_bar.dart';
import 'package:abiola_along_client_app/src/features/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/views/sign_in/views/sign_in.dart';
import '../features/home/views/home.dart';
import '../features/notification/views/notification.dart';
import '../features/tag/views/tag.dart';
import '../features/user_type.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final routerConfigProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: _navigatorKey,
      initialLocation: UserType.path,
      routes: [
        GoRoute(
          path: UserType.path,
          name: UserType.name,
          builder: UserType.builder,
        ),
        GoRoute(
          path: SignUp.path,
          name: SignUp.name,
          builder: SignUp.builder,
        ),
        GoRoute(
          path: SignIn.path,
          name: SignIn.name,
          builder: SignIn.builder,
        ),
        GoRoute(
          path: ForgetPassword.path,
          name: ForgetPassword.name,
          builder: ForgetPassword.builder,
        ),
        GoRoute(
          path: UpdatePassword.path,
          name: UpdatePassword.name,
          builder: UpdatePassword.builder,
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return NavigationView(
              navigationShell: navigationShell,
            );
          },
          branches: <StatefulShellBranch>[
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
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: Tag.path,
                  name: Tag.name,
                  builder: Tag.builder,
                )
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: NotificationView.path,
                  name: NotificationView.name,
                  builder: NotificationView.builder,
                )
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: ProfileView.path,
                  name: ProfileView.name,
                  builder: ProfileView.builder,
                  // routes: [
                  //   GoRoute(
                  //     parentNavigatorKey: _navigatorKey,
                  //     path: Notifications.path,
                  //     name: Notifications.name,
                  //     builder: Notifications.builder,
                  //   ),
                  //   GoRoute(
                  //     path: UpdateProfile.path,
                  //     name: UpdateProfile.name,
                  //     builder: UpdateProfile.builder,
                  //     parentNavigatorKey: _navigatorKey,
                  //   ),
                  //   GoRoute(
                  //     path: ChangePassword.path,
                  //     name: ChangePassword.name,
                  //     builder: ChangePassword.builder,
                  //     parentNavigatorKey: _navigatorKey,
                  //   ),
                  //   GoRoute(
                  //     parentNavigatorKey: _navigatorKey,
                  //     path: TermsConditions.path,
                  //     name: TermsConditions.name,
                  //     builder: TermsConditions.builder,
                  //   ),
                  //   GoRoute(
                  //     parentNavigatorKey: _navigatorKey,
                  //     path: PrivacyPolicy.path,
                  //     name: PrivacyPolicy.name,
                  //     builder: PrivacyPolicy.builder,
                  //   ),
                  // ],
                )
              ],
            ),
          ],
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
  },
);
