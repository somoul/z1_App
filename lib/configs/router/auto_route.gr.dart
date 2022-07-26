// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../cores/splash_screen.dart' as _i1;
import '../../cores/walk_though/page/onborading_screen.dart' as _i5;
import '../../modules/bottom_bar.dart' as _i6;
import '../../modules/dassbord/dassbord_screen.dart' as _i8;
import '../../modules/profile/profile_screen.dart' as _i9;
import '../../modules/qr_screen/screen/qr_screen.dart' as _i3;
import '../../modules/scan_qp_code/scan_qr_code_screen.dart' as _i7;
import '../../utils/login/page/login_screen.dart' as _i2;
import '../../widgets/test_component.dart' as _i4;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SignInScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    },
    QrScreen.name: (routeData) {
      return _i10.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.QrScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    TestComponent.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.TestComponent());
    },
    OnboardingScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.OnboardingScreen());
    },
    BottomBar.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.BottomBar());
    },
    ScanQrCodeSceen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ScanQrCodeSceen());
    },
    DassbordScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.DassbordScreen());
    },
    ProfileScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfileScreen());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: '/slashScreen', fullMatch: true),
        _i10.RouteConfig(SplashScreen.name, path: '/slashScreen'),
        _i10.RouteConfig(SignInScreen.name, path: 'signInScreen'),
        _i10.RouteConfig(QrScreen.name, path: 'qrscreen'),
        _i10.RouteConfig(TestComponent.name, path: '/test'),
        _i10.RouteConfig(OnboardingScreen.name, path: 'onboardingScreen'),
        _i10.RouteConfig(BottomBar.name, path: '', children: [
          _i10.RouteConfig('#redirect',
              path: '',
              parent: BottomBar.name,
              redirectTo: 'dassbordScreen',
              fullMatch: true),
          _i10.RouteConfig(ScanQrCodeSceen.name,
              path: 'scanQrCodeSceen', parent: BottomBar.name),
          _i10.RouteConfig(DassbordScreen.name,
              path: 'dassbordScreen', parent: BottomBar.name),
          _i10.RouteConfig(ProfileScreen.name,
              path: 'profileScreen', parent: BottomBar.name)
        ]),
        _i10.RouteConfig('*#redirect',
            path: '*', redirectTo: '/dassbordScreen', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i10.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/slashScreen');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInScreen extends _i10.PageRouteInfo<void> {
  const SignInScreen() : super(SignInScreen.name, path: 'signInScreen');

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i3.QrScreen]
class QrScreen extends _i10.PageRouteInfo<void> {
  const QrScreen() : super(QrScreen.name, path: 'qrscreen');

  static const String name = 'QrScreen';
}

/// generated route for
/// [_i4.TestComponent]
class TestComponent extends _i10.PageRouteInfo<void> {
  const TestComponent() : super(TestComponent.name, path: '/test');

  static const String name = 'TestComponent';
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingScreen extends _i10.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(OnboardingScreen.name, path: 'onboardingScreen');

  static const String name = 'OnboardingScreen';
}

/// generated route for
/// [_i6.BottomBar]
class BottomBar extends _i10.PageRouteInfo<void> {
  const BottomBar({List<_i10.PageRouteInfo>? children})
      : super(BottomBar.name, path: '', initialChildren: children);

  static const String name = 'BottomBar';
}

/// generated route for
/// [_i7.ScanQrCodeSceen]
class ScanQrCodeSceen extends _i10.PageRouteInfo<void> {
  const ScanQrCodeSceen()
      : super(ScanQrCodeSceen.name, path: 'scanQrCodeSceen');

  static const String name = 'ScanQrCodeSceen';
}

/// generated route for
/// [_i8.DassbordScreen]
class DassbordScreen extends _i10.PageRouteInfo<void> {
  const DassbordScreen() : super(DassbordScreen.name, path: 'dassbordScreen');

  static const String name = 'DassbordScreen';
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileScreen extends _i10.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: 'profileScreen');

  static const String name = 'ProfileScreen';
}
