import 'package:flutter/material.dart';

import '../utils/app_color/app_colors.dart';

class CustomShip extends StatelessWidget {
  final String? title;
    final GestureTapCallback? onTap;
  const CustomShip({Key? key,this.title,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap!=null?
        onTap!():Container();

      },
      child: Container(
        // height: 100,
        // width: 100,
        decoration: BoxDecoration(
            color:Color(0xff47C6FF),
             borderRadius: BorderRadius.circular(10),
             ),
             child: Padding(
               padding: const EdgeInsets.only(top: 4,left: 10,right: 10,bottom: 4),
               child: Center(child:Text(title!,style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 13.5,
              color: AppColor.textColor.withOpacity(1),
              fontWeight: FontWeight.w300),),),
             ),
      ),
    );
  }
}
