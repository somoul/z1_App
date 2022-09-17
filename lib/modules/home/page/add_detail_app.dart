// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z1_app/modules/home/controler/home_comtroller.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/customtextfield.dart';
import 'detail_panding_screen.dart';
import 'detail_success_Screen.dart';

class AddDetaillAppScreen extends StatelessWidget {
  const AddDetaillAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController = Get.put(HomeController());
    // final maxLines = 11;
    int indexAdddetaillsuccess = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adddetaill',
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'product Success :',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 15.5,
                      color: AppColor.descriptionColor,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddDetaillAppSuccessScreen()),
                      );
                    },
                    child: Container(
                      width: 218,
                      height: 43,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.descriptionColor,
                                blurRadius: 0.5,
                                spreadRadius: 0.5)
                          ]),
                      child: Center(
                        child: Text(
                          'Write detail about Success ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 14.5,
                                  color: AppColor.descriptionColor,
                                  fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'product Panding :',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 15.5,
                      color: AppColor.descriptionColor,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddDetaillAppPandingScreen()),
                      );
                    },
                    child: Container(
                      width: 220,
                      height: 43,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.descriptionColor,
                                blurRadius: 0.5,
                                spreadRadius: 0.5)
                          ]),
                      child: Center(
                        child: Text(
                          'Write detail about panding ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 14.5,
                                  color: AppColor.descriptionColor,
                                  fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    // );
  }
}
