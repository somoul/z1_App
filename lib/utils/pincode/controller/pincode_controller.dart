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
  // final stoToken = ''.obs;
  final _homeController = Get.put(HomeController());
  final _profileController = Get.put(ProfileController());
  final stoToken = ''.obs;
  final isSelectToken = false.obs;
//  Future<void> lognInPincode(String pincode, BuildContext context) async {
//     isLoding(true);

    // var collection = FirebaseFirestore.instance.collection('user');
    // var querySnapshot = await collection.get();

  // for (var queryDocumentSnapshot in querySnapshot.docs) {
  //   Map<String, dynamic> data = queryDocumentSnapshot.data();

//       // if (pincode ==await data['pincode']) {
//       //   debugPrint(
//       //       '==========Pincode  : $pincode. == ${data['pincode']}. &&. ======stoToken 11 :${stoToken.value}');
//       //   // stoToken.value = data['token'];
//       //   _profileController.token.value =await data['token'];
//       //   _homeController.bree.value =await data['bree'];
//       //   _homeController.bree_token.value =await data['bree_token'];
//       //   debugPrint(
//       //       '==========bree  : ${_homeController.bree.value}. ==bree_token: ${_homeController.bree_token.value}. ');

//       //   LocalData.storeCurrentUser( _profileController.token.value);
//       //   // _profileController.getDataProfile(stoToken.value);
//       //   Timer(const Duration(seconds: 0), () {
//       //     context.navigateNamedTo("");

//       //     // _profileController.getDataProfile(token);
//       //   });

//       //   isLoding(false);

//       // } else {
//       //   // final snackdemo = SnackBar(
//       //   //   width: double.infinity,
//       //   //   //  padding:EdgeInsets.only(top: 10,bottom: 10),
//       //   //   content: const SizedBox(
//       //   //       height: 15,
//       //   //       child: Center(
//       //   //         child: Text('something went wrong...!'),
//       //   //       )),
//       //   //   backgroundColor: Colors.blue[300],
//       //   //   // elevation: 15,
//       //   //   behavior: SnackBarBehavior.floating,

//       //   //   //margin: EdgeInsets.all(1),
//       //   //   duration: const Duration(seconds: 3),
//       //   // );
//       //   // ScaffoldMessenger.of(context).showSnackBar(snackdemo);

//       //   isLoding(false);
//       // }
//     }
//   }LocalData.getCurrentUser()

  CollectionReference collection =
      FirebaseFirestore.instance.collection('user');

  Future<void> lognInPincode(String pincode, BuildContext context) async {
    stoToken.value = await LocalData.getCurrentUser();
    debugPrint('======== stoToken: ${stoToken.value}');
     debugPrint('======== isSelectToken: ${isSelectToken.value}');
    if (isSelectToken.value == true) {
      var querySnapshot = await collection.doc(stoToken.value).get();
      debugPrint('======== user :${querySnapshot['pincode']}');
      if (querySnapshot['pincode'] == pincode ||
          _profileController.token.value == querySnapshot['token']) {
        context.navigateNamedTo("");
      } else {
        debugPrint('======== user  flase:===========');
      }
    } else {
      return collection.doc(stoToken.value)
          //updating grade value of a specific student
          .update({'pincode': pincode, 'token': '${stoToken.value}'}).then(
              (value) {
        print("========Student data Updated=========");
        context.navigateNamedTo("");
      });
      // .catchError((error) => print("=====Failed to update data===="));
    }
  }
}
