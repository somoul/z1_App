// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:z1_app/utils/app_color/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;
  const CustomButton({
    this.padding,
    this.onTap,
    this.title = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.buttonColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Center(
            child: Text(
              title!,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColor.textColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
    // Center(
    //     child: Padding(
    //         padding: padding ?? const EdgeInsets.only(left: 0),
    //         child: ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //               primary: colors != null ? colors : AppColor.buttonColor,
    //               padding: padding != null
    //                   ? padding
    //                   :kIsWeb? const EdgeInsets.only(left: 23, right: 23,top: 5,bottom: 5):const EdgeInsets.only(left: 21, right: 21),
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(8.0),
    //                   side: const BorderSide(color: Colors.white30,width: 1.3)),
    //               textStyle: const TextStyle(
    //                   fontSize: 30, fontWeight: FontWeight.bold)),
    //           child: Text(title ?? '',
    //               style: const TextStyle(color: Colors.white, fontSize: 16)),
    //           onPressed: () {
    //             onTap!();
    //           },
    //         )));
  }
}
