import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/modules/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import '../../modules/user/pages/user_page.dart';

final routerConfig = GoRouter(
  // refreshListenable: injector<AuthController>(),
  // redirect: (context, state) {
  //   final isAuthenticated = injector<AuthController>().isLogged;
  //   final isLoginRoute = state.subloc == routeLogin;
  //   if (!isAuthenticated) {
  //     return isLoginRoute ? null : routeLogin;
  //   }
  // },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: 'user',
          builder: (BuildContext context, GoRouterState state) {
            return UserPage();
          },
        ),
      ],
    ),
  ],
);
