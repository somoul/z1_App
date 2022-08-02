import 'package:auto_route/auto_route.dart';
import 'package:z1_app/widgets/test_component.dart';
// import 'package:z1_web_view_app/modules/qr_screen/screen/qr_screen.dart';

import '../../cores/splash_screen.dart';
import '../../cores/walk_though/page/onborading_screen.dart';
import '../../modules/bottom_bar.dart';
import '../../modules/dassbord/dassbord_screen.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/qr_screen/screen/qr_screen.dart';
import '../../modules/scan_qp_code/scan_qr_code_screen.dart';
import '../../utils/login/page/login_qrcode_screen.dart';
import '../../utils/login/page/login_screen.dart';
import '../../utils/pincode/page/pincode_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //OnboardingScreen

    AutoRoute(
      path: "/slashScreen",
      page: SplashScreen,
      initial: true,
    ),//PinCodeScreen
    AutoRoute(path: "signInScreen", page: SignInScreen, name: 'SignInScreen'),
     AutoRoute(path: "pinCodeScreen", page: PinCodeScreen, name: 'PinCodeScreen'),
   
    CustomRoute(
      page: QrScreen,
      path: 'qrscreen',
      // initial: true,
    ),
    AutoRoute(
      path: "/test",
      page: TestComponent,
      // initial: true,
    ),
    AutoRoute(
        path: "loginQrCodeScreen",
        page: LoginQrCodeScreen,
        name: 'LoginQrCodeScreen'),
    AutoRoute(
        path: "onboardingScreen",
        page: OnboardingScreen,
        name: 'OnboardingScreen'),
    AutoRoute(path: "", page: BottomBar, children: [
      AutoRoute(
        page: ScanQrCodeSceen,
        path: 'scanQrCodeSceen',
        name: "ScanQrCodeSceen",
      ),
      AutoRoute(
        initial: true,
        path: "dassbordScreen",
        name: "DassbordScreen",
        page: DassbordScreen,
      ),
      AutoRoute(
        path: "profileScreen",
        name: "ProfileScreen",
        page: ProfileScreen,
      ),
    ]),

    RedirectRoute(path: '*', redirectTo: '/dassbordScreen')
  ],
)
class $AppRouter {}
