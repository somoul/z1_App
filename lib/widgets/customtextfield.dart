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
      height: 53,
      child: TextField(
        autofocus: true,
        maxLines: 1,
        cursorHeight: 13,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: 13.5,
            color: AppColor.descriptionColor,
            fontWeight: FontWeight.w300),
        controller: controller,
        onChanged: (String value) {
          //  _homeController.successTextEditingController[]=
          // onChanged!();
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

class CustomTextField1 extends StatelessWidget {
  final TextEditingController? controller;
  final bool? isValidate;
  final bool? isRequist;
  final String? decriptionValidate;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? label;
  final String? subLabel;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  const CustomTextField1({
    Key? key,
    this.label = '',
    this.onEditingComplete,
    this.obscureText = false,
    this.isRequist = false,
    this.suffixIcon,
    this.validator,
    this.subLabel = '',
    this.focusNode,
    this.keyboardType,
    this.controller,
    this.isValidate = false,
    this.decriptionValidate,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          autocorrect: true,
          onChanged: onChanged,
          controller: controller,
          style: Theme.of(context).textTheme.headline5,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText!,
          decoration: InputDecoration(
            label: SizedBox(
              width: isRequist! ? label!.length * 10 : label!.length * 9,
              child: Row(children: [
                Text(label ?? ''),
                if (isRequist!)
                  Text(
                    ' *',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: AppColor.buttonColor),
                  ),
              ]),
            ),
            suffixIcon: suffixIcon != null ? suffixIcon! : null,
            contentPadding: const EdgeInsets.symmetric(
              // horizontal: 15.0,
              vertical: 0.0,
            ),
            // fillColor: Theme.of(context).secondaryHeaderColor,
            // filled: true,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 14,
                ),
            labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 14,
                ),

            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).secondaryHeaderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).canvasColor),
            ),
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).secondaryHeaderColor),
            ),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(7.0),
            //   borderSide: BorderSide(
            //     color: Theme.of(context).cardColor,
            //   ),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(7.0),
            //   borderSide: BorderSide(
            //     color: Theme.of(context).canvasColor,
            //   ),
            // ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 5),
        //   child: CustomValidate(
        //     isValidate: isValidate!,
        //     decription: decriptionValidate,
        //   ),
        // )
      ],
    );
  }
}
