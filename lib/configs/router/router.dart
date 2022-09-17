import 'package:go_router/go_router.dart';
import 'package:z1_app/cores/auth/screen/auth_screen.dart';
import 'package:z1_app/cores/splash_screen.dart';
import 'package:z1_app/cores/walk_though/page/onborading_screen.dart';
import 'package:z1_app/modules/home/page/home_screen.dart';
import 'package:z1_app/modules/qr_screen/screen/qr_screen.dart';

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcomescreen';
  static String auth = '/authscreen';
  static String home = '/homescreen';
  static String qr = '/qrscreen';
}

final router = GoRouter(
  initialLocation: ScreenPaths.auth,
  // redirect: _handleRedirect,
  routes: [
    GoRoute(
      path: ScreenPaths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: ScreenPaths.intro,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: ScreenPaths.auth,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: ScreenPaths.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: ScreenPaths.qr,
      builder: (context, state) => const QrScreen(),
    ),
  ],
);

// String? _handleRedirect(GoRouterState state) => '';
