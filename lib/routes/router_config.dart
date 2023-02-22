import 'package:flutter/material.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:fluttertest/services/navigation_service.dart';
import 'package:fluttertest/widgets/nav/bottom_tab_bar.dart';
import 'package:go_router/go_router.dart';

GoRouter routerConfig() {
  return GoRouter(
    // initialLocation: const HomeRoute().location,

    // changes on the listenable will cause the router to refresh it's route
    // refreshListenable: loginInfo,

    redirect: (BuildContext context, GoRouterState state) {
      // final bool loggedIn = loginInfo.loggedIn;

      // check just the subloc in case there are query parameters
      // final String loginLoc = const LoginRoute().location;
      // final bool goingToLogin = state.subloc == loginLoc;

      // the user is not logged in and not headed to /login, they need to login
      // if (!loggedIn && !goingToLogin) {
      //   return SignInSocialRoute(fromPage: state.subloc).location;
      // }

      // the user is logged in and headed to /login, no need to login again
      // if (loggedIn && goingToLogin) {
      //   return const HomeRoute().location;
      // }

      // no need to redirect at all
      return null;
    },

    routes: [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: BottomTabBar(state: state, child: child),
          );
        },
        routes: [
          $rootRoute,
        ],
      ),
    ],

    // errorPageBuilder: (context, state) => MaterialPage<void>(
    //   key: state.pageKey,
    //   child: ErrorPage(state.error),
    // ),

    navigatorKey: NavigationService.navigatorKey,
  );
}
