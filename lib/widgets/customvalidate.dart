import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomValidate extends StatelessWidget {
  final bool isValidate;
  final String? decription;
  const CustomValidate({Key? key, this.decription, this.isValidate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isValidate == false
        ?const SizedBox(height: 0,width: 0,)
        : Row(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(math.pi),
                child:  Icon(
                  Icons.info_rounded,
                  size: 15.5,
                  color:const Color(0xFFEB252A).withOpacity(0.8),
                ),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  "$decription",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xffEB252A),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          );
  }
}
