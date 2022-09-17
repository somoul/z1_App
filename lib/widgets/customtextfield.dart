import 'package:flutter/material.dart';
import '../utils/app_color/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? isValidate;
  final String? decriptionValidate;
  final String? hintText;
  final GestureTapCallback? onChanged;

  const CustomTextField({
    Key? key,
    this.onChanged,
    this.controller,
    this.isValidate = false,
    this.decriptionValidate,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323,
      height: 53,
      child: TextField(
        maxLines: 1,
        cursorHeight: 13,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: 13.5,
            color: AppColor.descriptionColor,
            fontWeight: FontWeight.w300),
        controller: controller,
        onChanged: (String value) {
          // myData['app_name'] = value;
        },
        decoration: InputDecoration(
          hintText: "detail app",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: AppColor.descriptionColor.withOpacity(0.4), width: 1.8),
          ),
          focusedBorder: OutlineInputBorder(
            // gapPadding: 0.0,
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: AppColor.descriptionColor.withOpacity(0.5), width: 1.8),
          ),
          contentPadding: const EdgeInsets.only(top: 3, left: 10),

          // errorText:'test error'
        ),
      ),
    );
  }
}
