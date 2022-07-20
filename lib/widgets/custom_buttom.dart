import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color?colors;
  // final double?height;
  // final double?width;
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
   return GestureDetector(
     onTap: (){
       onTap!();
     },
     child: Container(
     //  height:height?? 50,
      //  width:width??double.infinity,
       decoration: BoxDecoration(
      
         borderRadius: BorderRadius.circular(10),
         border: Border.all(
           width: 1.05,
           color: Theme.of(context).canvasColor,
         ),
         color: Colors.transparent,
       ),
       child: Center(
         child: Padding(
           padding: padding??const EdgeInsets.only(left: 0),
           child: Text(
             title ?? '',
             style:const TextStyle(color:Colors.white,fontSize: 16 )),
         )
       ),
     ),
   );
  
  }
}
