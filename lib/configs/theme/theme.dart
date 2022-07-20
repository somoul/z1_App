import 'package:flutter/material.dart';

import '../../utils/app_color/app_colors.dart';
// import 'package:z1_web_view_app/utils/app_color/app_colors.dart';

ThemeData theme() {
  return ThemeData.light().copyWith(
    primaryColor: AppColor.backgroundColor,
    canvasColor: AppColor.buttonColor,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: 'roboto_regular',
            fontSize:22,
            fontWeight: FontWeight.normal,
            color: AppColor.textColor),
        headline2: TextStyle(
            fontFamily: 'roboto_regular',
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: AppColor.textColor),
        headline3: TextStyle(
            fontFamily: 'roboto_regular',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: AppColor.textColor),
        headline4: TextStyle(
          fontFamily: 'roboto_regular',
          fontSize:16,
          fontWeight: FontWeight.normal,
          color: AppColor.textColor
          ),
        headline5: TextStyle(
          fontFamily: 'roboto_regular',
          fontSize:14,
          fontWeight: FontWeight.normal,
        color: AppColor.textColor
        ),
        headline6: TextStyle(
          fontFamily: 'roboto_regular',
          fontSize: 10,
          fontWeight:FontWeight.normal,
          color: AppColor.textColor
        ),
        button:TextStyle(
          fontFamily: 'roboto_regular',
          fontSize:14,
          fontWeight: FontWeight.normal,
          color: AppColor.buttonColor
        )
          ),
  );
}
