import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_color/app_colors.dart';
import '../controller/login_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginController=Get.put(LoginController());
   // bool isCheckClick=false;
    return Scaffold(
      appBar: null,
      backgroundColor:const Color(0xffF1F3F6),
      body: Obx(()=> Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xffF2F4FA),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  // color: Colors.white,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      // bottomLeft:Radius.circular(80),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome!',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 28,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Sign in and get started',
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your Email',
                      hintText: "Enter your Email",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.descriptionColor.withOpacity(0.4),
                            width: 1.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.descriptionColor.withOpacity(0.5),
                            width: 1.8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 23, horizontal: 23),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your Password',
                      hintText: "Enter your Password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.descriptionColor.withOpacity(0.4),
                            width: 1.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.descriptionColor.withOpacity(0.5),
                            width: 1.8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 23, horizontal: 23),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 23, right: 23, bottom: 20, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                          //isCheckClick=
                         if(_loginController.isCheckClick.value==false)
                         {
                       _loginController.isCheckClick.value=true;
                         }
                         else{
                           _loginController.isCheckClick.value=false;
                         }
                          debugPrint('====Show debug  isCheckClick : ${_loginController.isCheckClick.value}');
                        },
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                              color: AppColor.buttonColor,
                              borderRadius: BorderRadius.circular(3)),
                        child:_loginController.isCheckClick.value?const Center(
                            child: Icon(Icons.check,size: 14.5,color: Colors.white)
                        ):null,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: Text(
                          "Remember me",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: AppColor.descriptionColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          "Forgot Password",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: AppColor.descriptionColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
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
                        "Login",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Don't have an account ? ",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Register here",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          // child:

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     const SizedBox(
          //       height: 90,
          //     ),
          //     Text(
          //       'Hello Again!',
          // style: Theme.of(context)
          //     .textTheme
          //     .headline5!
          //     .copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          //       child: Text(
          //         'Wellcome back you are been missed !',
          //         style: Theme.of(context).textTheme.headline5!.copyWith(
          //             color: Colors.black54, fontWeight: FontWeight.w500),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     // const Material(
          //     //   elevation: 18,
          //     //   shadowColor: Colors.purple,
          //     //   child: TextField(
          //     //     decoration: InputDecoration(
          //     //       fillColor: Colors.white,
          //     //       filled: true,
          //     //     ),
          //     //   ),
          //     // ),
          //    const Padding(
          //       padding:  EdgeInsets.only(left:20, right: 20),
          //       child: TextField(
          //         decoration: InputDecoration(

          //           fillColor: Colors.white,
          //           filled: true,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
      // CustomPaint(
      //   painter: MyShape(),
      //   child: Container(),
      // ),
      //  Stack(
      //   children: [
      //     Center(
      //       child: Container(
      //         decoration:  BoxDecoration(
      //             gradient: LinearGradient(
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //           stops: const[
      //          0.6,
      //             0.3,
      //             0.5,
      //              2,
      //             0.06,
      //               0.6,
      //           ],
      //           colors: [
      //            const Color(0xffCACDF3).withOpacity(0.5),
      //            const Color(0xffFFFFFF).withOpacity(0.5),
      //           const  Color(0xffCACDF3).withOpacity(0.5),
      //           const   Color(0xffFFFFFF).withOpacity(0.5),
      //           const   Color(0xffCACDF3).withOpacity(0.5),
      //           const       Color(0xffFFFFFF).withOpacity(0.5),
      //           ],
      //         )),
      //       ),
      //     ),
      //       Positioned(
      //       left: 30,
      //       top: 50,
      //       child: Column(
      //         children: [
      //           Row(
      //             children:const [
      //               Text('Already',style: TextStyle(fontSize: 20,color:Colors.black,fontWeight:FontWeight.bold),),

      //               Text(' Member?',style: TextStyle(fontSize: 20,color:Color(0xff3366FF),fontWeight:FontWeight.bold),),
      //             ],
      //           ),

      //           const SizedBox(height: 30,),

      //         ],
      //       ))
      //   ],
      // ),
    );
  }
}

// class MyShape extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//     final paint = Paint();
//     final path = Path();
//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 15;
//     paint.color = Colors.blueAccent;
//     // path.moveTo(0, size.height * 0.8);
//     path.quadraticBezierTo(
//       size.width * 0.1,
//       size.height * 0.78,
//       size.width * 0.3,
//       size.height * 0.89,
//     );
//     // path.quadraticBezierTo(
//     //   size.width * 0.45,
//     //   size.height * 0.95,
//     //   size.width * 0.6,
//     //   size.height * 0.85,
//     // );
//     // path.quadraticBezierTo(
//     //   size.width * 0.75,
//     //   size.height * 0.75,
//     //   size.width * 0.85,
//     //   size.height * 0.7,
//     // );
//     // path.quadraticBezierTo(
//     //   size.width * 0.95,
//     //   size.height * 0.65,
//     //   size.width * 1,
//     //   size.height * 0.68,
//     // );
//     // path.lineTo(size.width, size.height);
//     // path.lineTo(0, size.height);
//     // path.lineTo(0, size.height * 0.8);
//     canvas.drawPath(path, paint);
//     final paint1 = Paint();
//     //paint1.style = PaintingStyle.fill;
//     paint1.color = Colors.yellow;
//     // canvas.drawPath(path, paint1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }
