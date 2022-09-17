import 'package:flutter/material.dart';

extension AppColor on Color {
  static const MaterialColor appswatch =
      MaterialColor(_appswatchPrimaryValue, <int, Color>{
    50: Color(0xFFE4E5E7),
    100: Color(0xFFBDBDC4),
    200: Color(0xFF91929D),
    300: Color(0xFF646676),
    400: Color(0xFF434558),
    500: Color(_appswatchPrimaryValue),
    600: Color(0xFF1E2035),
    700: Color(0xFF191B2D),
    800: Color(0xFF141626),
    900: Color(0xFF0C0D19),
  });
  static const int _appswatchPrimaryValue = 0xFF22243B;

  static const MaterialColor appswatchAccent =
      MaterialColor(_appswatchAccentValue, <int, Color>{
    100: Color(0xFF5B6DFF),
    200: Color(_appswatchAccentValue),
    400: Color(0xFF001BF4),
    700: Color(0xFF0018DA),
  });

  static const int _appswatchAccentValue = 0xFF2840FF;
  static final backgroundColor = Color(0xffDFE5FB);
  static final hintColor = Color(0xff000000).withOpacity(0.38);
  static final mainColor = Color(0xff22243B);
  static final descriptionColor = const Color(0xff5E81FF).withOpacity(0.9);
  static final textColor = const Color(0xff000000).withOpacity(0.87);
  static final buttonColor = Colors.blueAccent;
  static final disableButtonColor = Colors.black38;
}
