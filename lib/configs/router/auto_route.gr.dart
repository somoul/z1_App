// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../../cores/splash_screen.dart' as _i1;
import '../../cores/walk_though/page/onborading_screen.dart' as _i6;
import '../../modules/bottom_bar.dart.dart' as _i7;
import '../../modules/home/page/add_app_screen.dart' as _i8;
import '../../modules/home/page/home_screen.dart' as _i12;
import '../../modules/profile/page/profile_screen.dart' as _i13;
import '../../modules/profile/page/viewprofile_screen.dart' as _i10;
import '../../modules/qr_screen/screen/qr_screen.dart' as _i4;
import '../../modules/scan_qp_code/scan_qr_code_screen.dart' as _i11;
import '../../utils/login/page/login_qrcode_screen.dart' as _i5;
import '../../utils/login/page/login_screen.dart' as _i2;
import '../../utils/pincode/page/pincode_screen.dart' as _i3;
import '../../utils/show_image_qrcode/qrcode.dart' as _i9;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SignInScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    },
    PinCodeScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PinCodeScreen());
    },
    QrScreen.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.QrScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    LoginQrCodeScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.LoginQrCodeScreen());
    },
    OnboardingScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.OnboardingScreen());
    },
    BottomBar.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.BottomBar());
    },
    AddAppScreen.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.AddAppScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    QrcodeScreen.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.QrcodeScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    ViewProfile.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ViewProfile());
    },
    ScanQrCodeSceen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ScanQrCodeSceen());
    },
    HomeScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomeScreen());
    },
    ProfileScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ProfileScreen());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig('/#redirect',
            path: '/', redirectTo: '/slashScreen', fullMatch: true),
        _i14.RouteConfig(SplashScreen.name, path: '/slashScreen'),
        _i14.RouteConfig(SignInScreen.name, path: 'signInScreen'),
        _i14.RouteConfig(PinCodeScreen.name, path: 'pinCodeScreen'),
        _i14.RouteConfig(QrScreen.name, path: 'qrscreen'),
        _i14.RouteConfig(LoginQrCodeScreen.name, path: 'loginQrCodeScreen'),
        _i14.RouteConfig(OnboardingScreen.name, path: 'onboardingScreen'),
        _i14.RouteConfig(BottomBar.name, path: '', children: [
          _i14.RouteConfig('#redirect',
              path: '',
              parent: BottomBar.name,
              redirectTo: 'homeScreen',
              fullMatch: true),
          _i14.RouteConfig(ScanQrCodeSceen.name,
              path: 'scanQrCodeSceen', parent: BottomBar.name),
          _i14.RouteConfig(HomeScreen.name,
              path: 'homeScreen', parent: BottomBar.name),
          _i14.RouteConfig(ProfileScreen.name,
              path: 'profileScreen', parent: BottomBar.name)
        ]),
        _i14.RouteConfig(AddAppScreen.name, path: 'addAppScreen'),
        _i14.RouteConfig(QrcodeScreen.name, path: 'qrcodeScreen'),
        _i14.RouteConfig(ViewProfile.name, path: 'viewProfile'),
        _i14.RouteConfig('*#redirect',
            path: '*', redirectTo: '/dassbordScreen', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i14.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/slashScreen');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInScreen extends _i14.PageRouteInfo<void> {
  const SignInScreen() : super(SignInScreen.name, path: 'signInScreen');

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i14.PageRouteInfo<void> {
  const PinCodeScreen() : super(PinCodeScreen.name, path: 'pinCodeScreen');

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.QrScreen]
class QrScreen extends _i14.PageRouteInfo<void> {
  const QrScreen() : super(QrScreen.name, path: 'qrscreen');

  static const String name = 'QrScreen';
}

/// generated route for
/// [_i5.LoginQrCodeScreen]
class LoginQrCodeScreen extends _i14.PageRouteInfo<void> {
  const LoginQrCodeScreen()
      : super(LoginQrCodeScreen.name, path: 'loginQrCodeScreen');

  static const String name = 'LoginQrCodeScreen';
}

/// generated route for
/// [_i6.OnboardingScreen]
class OnboardingScreen extends _i14.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(OnboardingScreen.name, path: 'onboardingScreen');

  static const String name = 'OnboardingScreen';
}

/// generated route for
/// [_i7.BottomBar]
class BottomBar extends _i14.PageRouteInfo<void> {
  const BottomBar({List<_i14.PageRouteInfo>? children})
      : super(BottomBar.name, path: '', initialChildren: children);

  static const String name = 'BottomBar';
}

/// generated route for
/// [_i8.AddAppScreen]
class AddAppScreen extends _i14.PageRouteInfo<void> {
  const AddAppScreen() : super(AddAppScreen.name, path: 'addAppScreen');

  static const String name = 'AddAppScreen';
}

/// generated route for
/// [_i9.QrcodeScreen]
class QrcodeScreen extends _i14.PageRouteInfo<void> {
  const QrcodeScreen() : super(QrcodeScreen.name, path: 'qrcodeScreen');

  static const String name = 'QrcodeScreen';
}

/// generated route for
/// [_i10.ViewProfile]
class ViewProfile extends _i14.PageRouteInfo<void> {
  const ViewProfile() : super(ViewProfile.name, path: 'viewProfile');

  static const String name = 'ViewProfile';
}

/// generated route for
/// [_i11.ScanQrCodeSceen]
class ScanQrCodeSceen extends _i14.PageRouteInfo<void> {
  const ScanQrCodeSceen()
      : super(ScanQrCodeSceen.name, path: 'scanQrCodeSceen');

  static const String name = 'ScanQrCodeSceen';
}

/// generated route for
/// [_i12.HomeScreen]
class HomeScreen extends _i14.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: 'homeScreen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i13.ProfileScreen]
class ProfileScreen extends _i14.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: 'profileScreen');

  static const String name = 'ProfileScreen';
}
