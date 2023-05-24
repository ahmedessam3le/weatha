import 'package:go_router/go_router.dart';
import 'package:weatha/home/presentation/views/home_view.dart';

import '../../splash/presentation/views/splash_view.dart';

class AppRoutes {
  static const String splashRoute = '/';
  static const String homeRoute = '/homeRoute';
}

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splashRoute,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: AppRoutes.homeRoute,
        builder: (context, state) {
          return const HomeView();
        },
      ),
    ],
  );
}
