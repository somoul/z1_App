// ignore_for_file: must_be_immutable, use_full_hex_values_for_flutter_colors, prefer_const_constructors, avoid_unnecessary_containers, dead_code
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomCart extends StatelessWidget {
  String? title;
  String? linkApp;
  String? colors;
  String? image;
  Function? onTap;
  CustomCart(
      {Key? key, this.colors, this.image, this.linkApp, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPressed = true;
    Offset distane = isPressed ? Offset(15, 15) : Offset(40, 40);
    //double blur = isPressed ? 50.0 : 30.0;

    return GestureDetector(
      onTap: () {
        isPressed = !isPressed;
        debugPrint(' ======== isPressed:$isPressed======== ');
        onTap != null ? onTap!() : Container();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 10),
        decoration: BoxDecoration(
            color: Color(int.parse('0xff$colors')).withOpacity(0.95),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(int.parse('0xff$colors'))
                    .withOpacity(0.95), //: Colors.blue.shade100,
                blurRadius: 10,
                offset: isPressed ? -distane : distane,
                inset: isPressed,
                //spreadRadius:0.5,
                //fromDirection(4,-7),
                // blurStyle:BlurStyle.outer
              ),
              BoxShadow(
                color: Color(int.parse('0xff$colors'),).withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(6.5, -5.5),
                blurStyle: BlurStyle.solid,
                inset: false,
                //spreadRadius:0.5,
                //fromDirection(4,-7),
                // blurStyle:BlurStyle.outer
              ),
            ]),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          //  color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                image ?? '',
                height: 50.9,
                width: 50.9,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                '$title',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: kIsWeb ? 15 : 10,
                    color: Colors.white.withOpacity(0.83),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
