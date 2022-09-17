import 'package:flutter/material.dart';

import '../../utils/app_color/app_colors.dart';

ThemeData theme() => ThemeData(
      scaffoldBackgroundColor: AppColor.backgroundColor,
      primaryColor: AppColor.mainColor,
      primaryColorLight: AppColor.mainColor,
      primarySwatch: AppColor.appswatch,
      fontFamily: 'Lexend',
      canvasColor: AppColor.buttonColor,
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor),
          headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: AppColor.textColor),
          button: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColor.buttonColor)),
    );
