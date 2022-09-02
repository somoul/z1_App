// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:z1_app/utils/pincode/controller/pincode_controller.dart';

import '../modules/home/controler/home_comtroller.dart';
import '../modules/profile/controller/profile_controller.dart';
import '../utils/stolocal_data/local_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = '';
  final _pincodeController=Get.put(PinCodeController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      token = await LocalData.getCurrentUser();
      debugPrint("22===== 1111 show token :$token");
      if (token != '') {
        // var collection = FirebaseFirestore.instance.collection('user');
        // var querySnapshot = await collection.get();
        // for (var queryDocumentSnapshot in querySnapshot.docs) {
        //   Map<String, dynamic> data = queryDocumentSnapshot.data();
        //   if (token == await data['token']) {
        //     _profileController.token.value = token;
        //     _profileController.imageProfile.value = await data['image_profile'];
        //     _homeController.bree.value = await data['bree'];
        //     _homeController.bree_token.value = await data['bree_token'];
        //     debugPrint(
        //         '==========bree  : ${_homeController.bree.value}. ==bree_token: ${_homeController.bree_token.value}. ');

        //     // _profileController.getDataProfile(stoToken.value);

        //   }
        // }
        // _profileController.getDataProfile(token);
        // Timer(const Duration(seconds: 0), () async {
        //  // await context.navigateNamedTo("");
        // });
        _pincodeController.isSelectToken.value=true;
        context.navigateNamedTo('pinCodeScreen');
      } else {
        context.navigateNamedTo('onboardingScreen');
      }
    });
    super.initState();
  } // SlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'asset/image/image_png/z1_logo_px.png',
                    width: 150,
                    height: 150,
                  )
                  //      Image.svg(,
                  //   height: 165,
                  //   width: 165,
                  // ) //Text('Show SlashScreen ')
                  ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 5.0,
                color: Color.fromARGB(255, 101, 201, 226),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
