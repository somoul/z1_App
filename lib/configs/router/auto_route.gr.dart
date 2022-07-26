// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../cores/splash_screen.dart' as _i1;
import '../../cores/walk_though/page/onborading_screen.dart' as _i6;
import '../../modules/bottom_bar.dart.dart' as _i7;
import '../../modules/home/page/home_screen.dart' as _i10;
import '../../modules/profile/page/profile_screen.dart' as _i11;
import '../../modules/profile/page/viewprofile_screen.dart' as _i8;
import '../../modules/qr_screen/screen/qr_screen.dart' as _i4;
import '../../modules/scan_qp_code/scan_qr_code_screen.dart' as _i9;
import '../../utils/login/page/login_qrcode_screen.dart' as _i5;
import '../../utils/login/page/login_screen.dart' as _i2;
import '../../utils/pincode/page/pincode_screen.dart' as _i3;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SignInScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    },
    PinCodeScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PinCodeScreen());
    },
    QrScreen.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.QrScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    LoginQrCodeScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.LoginQrCodeScreen());
    },
    OnboardingScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.OnboardingScreen());
    },
    BottomBar.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.BottomBar());
    },
    ViewProfile.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ViewProfile());
    },
    ScanQrCodeSceen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ScanQrCodeSceen());
    },
    HomeScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeScreen());
    },
    ProfileScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ProfileScreen());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig('/#redirect',
            path: '/', redirectTo: '/slashScreen', fullMatch: true),
        _i12.RouteConfig(SplashScreen.name, path: '/slashScreen'),
        _i12.RouteConfig(SignInScreen.name, path: 'signInScreen'),
        _i12.RouteConfig(PinCodeScreen.name, path: 'pinCodeScreen'),
        _i12.RouteConfig(QrScreen.name, path: 'qrscreen'),
        _i12.RouteConfig(LoginQrCodeScreen.name, path: 'loginQrCodeScreen'),
        _i12.RouteConfig(OnboardingScreen.name, path: 'onboardingScreen'),
        _i12.RouteConfig(BottomBar.name, path: '', children: [
          _i12.RouteConfig('#redirect',
              path: '',
              parent: BottomBar.name,
              redirectTo: 'homeScreen',
              fullMatch: true),
          _i12.RouteConfig(ScanQrCodeSceen.name,
              path: 'scanQrCodeSceen', parent: BottomBar.name),
          _i12.RouteConfig(HomeScreen.name,
              path: 'homeScreen', parent: BottomBar.name),
          _i12.RouteConfig(ProfileScreen.name,
              path: 'profileScreen', parent: BottomBar.name)
        ]),
        _i12.RouteConfig(ViewProfile.name, path: 'viewProfile'),
        _i12.RouteConfig('*#redirect',
            path: '*', redirectTo: '/dassbordScreen', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i12.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/slashScreen');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInScreen extends _i12.PageRouteInfo<void> {
  const SignInScreen() : super(SignInScreen.name, path: 'signInScreen');

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i12.PageRouteInfo<void> {
  const PinCodeScreen() : super(PinCodeScreen.name, path: 'pinCodeScreen');

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.QrScreen]
class QrScreen extends _i12.PageRouteInfo<void> {
  const QrScreen() : super(QrScreen.name, path: 'qrscreen');

  static const String name = 'QrScreen';
}

/// generated route for
/// [_i5.LoginQrCodeScreen]
class LoginQrCodeScreen extends _i12.PageRouteInfo<void> {
  const LoginQrCodeScreen()
      : super(LoginQrCodeScreen.name, path: 'loginQrCodeScreen');

  static const String name = 'LoginQrCodeScreen';
}

/// generated route for
/// [_i6.OnboardingScreen]
class OnboardingScreen extends _i12.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(OnboardingScreen.name, path: 'onboardingScreen');

  static const String name = 'OnboardingScreen';
}

/// generated route for
/// [_i7.BottomBar]
class BottomBar extends _i12.PageRouteInfo<void> {
  const BottomBar({List<_i12.PageRouteInfo>? children})
      : super(BottomBar.name, path: '', initialChildren: children);

  static const String name = 'BottomBar';
}

/// generated route for
/// [_i8.ViewProfile]
class ViewProfile extends _i12.PageRouteInfo<void> {
  const ViewProfile() : super(ViewProfile.name, path: 'viewProfile');

  static const String name = 'ViewProfile';
}

/// generated route for
/// [_i9.ScanQrCodeSceen]
class ScanQrCodeSceen extends _i12.PageRouteInfo<void> {
  const ScanQrCodeSceen()
      : super(ScanQrCodeSceen.name, path: 'scanQrCodeSceen');

  static const String name = 'ScanQrCodeSceen';
}

/// generated route for
/// [_i10.HomeScreen]
class HomeScreen extends _i12.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: 'homeScreen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileScreen extends _i12.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: 'profileScreen');

  static const String name = 'ProfileScreen';
}
