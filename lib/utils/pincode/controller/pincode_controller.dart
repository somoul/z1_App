// ignore_for_file: unused_label, use_build_context_synchronously, prefer_const_constructors, unnecessary_string_interpolations

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/home/controler/home_comtroller.dart';
import '../../../modules/profile/controller/profile_controller.dart';
import '../../stolocal_data/local_data.dart';

class PinCodeController extends GetxController {
  final numberLoginPassCode = 0.obs;
  final numberTimmerDelayed = 0.obs;
  final time = 15.obs;
  final isLoding = false.obs;
  final stoToken = ''.obs;
  final _homeController = Get.put(HomeController());
  final _profileController = Get.put(ProfileController());
 Future<void> lognInPincode(String pincode, BuildContext context) async {
    isLoding(true);

    var collection = FirebaseFirestore.instance.collection('user');
    var querySnapshot = await collection.get();

    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();

      if (pincode ==await data['pincode']) {
        debugPrint(
            '==========Pincode  : $pincode. == ${data['pincode']}. &&. ======stoToken 11 :${stoToken.value}');
        // stoToken.value = data['token'];
        _profileController.token.value =await data['token'];
        _homeController.bree.value =await data['bree'];
        _homeController.bree_token.value =await data['bree_token'];
        debugPrint(
            '==========bree  : ${_homeController.bree.value}. ==bree_token: ${_homeController.bree_token.value}. ');

        LocalData.storeCurrentUser( _profileController.token.value);
        // _profileController.getDataProfile(stoToken.value);
        Timer(const Duration(seconds: 0), () {
          context.navigateNamedTo("");

          // _profileController.getDataProfile(token);
        });

        isLoding(false);
      } else {
        // final snackdemo = SnackBar(
        //   width: double.infinity,
        //   //  padding:EdgeInsets.only(top: 10,bottom: 10),
        //   content: const SizedBox(
        //       height: 15,
        //       child: Center(
        //         child: Text('something went wrong...!'),
        //       )),
        //   backgroundColor: Colors.blue[300],
        //   // elevation: 15,
        //   behavior: SnackBarBehavior.floating,

        //   //margin: EdgeInsets.all(1),
        //   duration: const Duration(seconds: 3),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackdemo);

        isLoding(false);
      }
    }
  }
}
