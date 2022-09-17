import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_color/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final String? hintText;
  final String? labelText;

  final bool validated;

  const CustomTextFormField({
    this.controller,
    this.hintText,
    this.validated = false,
    Key? key,
    this.labelText,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TextEditingController _localController = TextEditingController();

  bool _enableBorder() {
    if (widget.controller != null) {
      if (widget.controller!.text.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      if (_localController.text.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText ?? 'Username',
            style: Theme.of(context).textTheme.headline1,
          ),
          // Theme.of(context).textTheme.headline1),
          const SizedBox(height: 5),
          SizedBox(
            height: 45,
            child: TextFormField(
              autofocus: true,
              controller: widget.controller ?? _localController,
              focusNode: widget.focusNode,
              onChanged: (v) {
                //make ui change when textfield has value
                setState(() {});
              },
              onFieldSubmitted: widget.onFieldSubmitted,
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Input ${widget.labelText ?? ''}',
                hintStyle: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: AppColor.hintColor),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: _enableBorder()
                      ? BorderSide(
                          color: widget.validated ? Colors.red : Colors.black)
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: _enableBorder()
                      ? BorderSide(
                          color: widget.validated ? Colors.red : Colors.black)
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 3),
          if (widget.validated)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'asset/image/image_svg/error.svg',
                  height: 20,
                ),
                SizedBox(width: 5),
                Text(
                  'Please input ${widget.hintText}',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
