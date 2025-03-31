import 'package:flutter/material.dart';
import 'package:forecast_x/features/onboarding/screen/onboarding_screen.dart';
import 'package:forecast_x/features/splash/screen/loading_screen/loading_screen.dart';
import 'package:forecast_x/features/splash/screen/welcome_page/welcome_page.dart';
import 'package:forecast_x/features/sections/chat_screen.dart';
import 'package:forecast_x/features/sections/forecasts_screen.dart';
import 'package:forecast_x/features/sections/rates_screen.dart';
import 'package:forecast_x/widgets/core_scaffold.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: routes.loader,
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/welcome_page',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: WelcomePage(),
          ),
        ),
        GoRoute(
          path: '/loading_splash_page',
          pageBuilder: (context, state) {
            String? path = state.uri.queryParameters['path'];
            String? query = state.uri.queryParameters['query'];
            return NoTransitionPage(
              child: LoadingScreen(
                path: path,
                query: query,
              ),
            );
          },
        ),
        GoRoute(
          path: '/onboarding',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: OnboardingScreen(),
          ),
        ),
      ],
      builder: (context, state, child) => CoreScaffold(
        navigationShell: null,
        body: child,
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CoreScaffold(
          body: navigationShell,
          navigationShell: navigationShell,
          showBottomNavBar: true,
        );
      },
      pageBuilder: (context, state, navigationShell) {
        return CustomTransitionPage(
          child: CoreScaffold(
            body: navigationShell,
            navigationShell: navigationShell,
            showBottomNavBar: true,
          ),
          transitionsBuilder: (context, animation, _, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/forecasts',
              builder: (context, state) => const ForecastsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/rates',
              builder: (context, state) => const RatesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chat',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ChatScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

class Routes {
  String get loader => '/loading_splash_page';
  String get onboarding => '/onboarding';
  String get welcomePage => '/welcome_page';
  String get forecasts => '/forecasts';
  String get chat => '/chat';
  String get rates => '/rates';
}

var routes = Routes();
