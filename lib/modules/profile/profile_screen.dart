import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color/app_colors.dart';
import '../controler_bottom_bar.dart/controller_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bottomBarController = Get.put(BottomBarController());
  
   
    // Timer? timer;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.buttonColor.withOpacity(0.8),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13, top: 5, bottom: 9.5),
            child: Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                  // /  color: Colors.red,
                  borderRadius: BorderRadius.circular(60),
                  image: const DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2wqLv2VOrfZeEAO3jSHxvmEL7eZA-VeJ_L8-L3q7gdcLzV6YeRGHpWoCr06dsriPxvYY&usqp=CAU',
                      ),
                      fit: BoxFit.fill)),
            ),
          )
        ],
        leading: Container(),
        //  IconButton(
        //     onPressed: () {
        //      // _bottomBarController.isSelecBaCK.value=true;
        //     //  _bottomBarController.selecClickButtomNavigetionBarback.value=_bottomBarController.selecClickButtomNavigetionBar.value;
        //       context.navigateBack();
        //     },
        //     icon: const Icon(
        //       Icons.close,
        //       size: 28,
        //     )),
        title: const Text('Profile'),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
            child: Column(
              // mainAxisAlignment: Main,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Last name ',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          'bav',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(
                      // height: 20,
                      thickness: 1.5,
                      // indent: 20,
                      endIndent: 0,
                      color: Colors.blue.withOpacity(0.8),
                    ),
                  ],
                ),
               const SizedBox(height: 35,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'First name ',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          'abraham',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(
                      // height: 20,
                      thickness: 1.5,
                      // indent: 20,
                      endIndent: 0,
                      color: Colors.blue.withOpacity(0.8),
                    ),
                  ],
                ),
                 const SizedBox(height: 35,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Email ',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          'somoulAbraham@gmail.com',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(
                      // height: 20,
                      thickness: 1.5,
                      // indent: 20,
                      endIndent: 0,
                      color: Colors.blue.withOpacity(0.8),
                    ),
                  ],
                ),
                 const SizedBox(height: 35,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Pincode ',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          '1234',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 16,
                              color: AppColor.descriptionColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(
                      // height: 20,
                      thickness: 1.5,
                      // indent: 20,
                      endIndent: 0,
                      color: Colors.blue.withOpacity(0.8),
                    ),
                  ],
                ),
               const Spacer(),
                const  Spacer(),
                  GestureDetector(
                    onTap: () {
                          
                      context
                                              .navigateNamedTo('signInScreen');
                     
                       
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
                          "Logout",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const   Spacer(),
                              const SizedBox(height: 210,),
              ],
            ),
          )),
    );
  }
}
