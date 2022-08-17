// ignore_for_file: unused_label, use_build_context_synchronously, prefer_const_constructors, unnecessary_string_interpolations

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/profile/controller/profile_controller.dart';
import '../../stolocal_data/local_data.dart';

class PinCodeController extends GetxController {
  final numberLoginPassCode = 0.obs;
  final numberTimmerDelayed = 0.obs;
  final time = 15.obs;
  final isLoding = false.obs;
  final stoToken = ''.obs;
  final _profileController = Get.put(ProfileController());
  lognInPincode(String pincode, BuildContext context) async {
    isLoding(true);
    
    var collection = FirebaseFirestore.instance.collection('user');
    var querySnapshot = await collection.get();
  
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();

      if (pincode == data['pincode']) {
        stoToken.value = data['token'];
        debugPrint(' ======stoToken 11 :${stoToken.value}');
         LocalData.storeCurrentUser(stoToken.value);
        _profileController.getDataProfile(stoToken.value);
         context.navigateNamedTo("");

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
