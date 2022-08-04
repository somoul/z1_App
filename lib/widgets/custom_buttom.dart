// ignore_for_file: prefer_if_null_operators

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:z1_app/utils/app_color/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? colors;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;
  const CustomButton({
    this.padding,
    // this.width,
    this.onTap,
    // this.height,
    this.title = '',
    this.colors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: padding ?? const EdgeInsets.only(left: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: colors != null ? colors : AppColor.buttonColor,
                  padding: padding != null
                      ? padding
                      :kIsWeb? const EdgeInsets.only(left: 23, right: 23,top: 5,bottom: 5):const EdgeInsets.only(left: 21, right: 21),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Colors.white30,width: 1.3)),
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              child: Text(title ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              onPressed: () {
                onTap!();
              },
            )));
  }
}
