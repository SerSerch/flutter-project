import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertest/screens/home_screen.dart';
import 'package:fluttertest/utilities/route_animation.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

@TypedGoRoute<RootRoute>(path: '/', routes: [
  TypedGoRoute<HomeRoute>(path: 'home'),
])
class RootRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      HomeRoute().location;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        key: state.pageKey,
        child: const Placeholder(),
      );
}

class HomeRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return routeAnimation(context, state, const HomeScreen());
  }
}
