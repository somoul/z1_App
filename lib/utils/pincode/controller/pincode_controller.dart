// ignore_for_file: unused_label, use_build_context_synchronously, prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinCodeController extends GetxController {
  final numberLoginPassCode = 0.obs;
  final numberTimmerDelayed = 0.obs;
  final time = 15.obs;
  final isLoding = false.obs;

  lognInPincode(String pincode, BuildContext context) async {
    isLoding(true);
    var collection = FirebaseFirestore.instance.collection('user');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();

      debugPrint(' ======11111 :${data['pincode']}');
      if (pincode == data['pincode']) {
        //_verificationNotifier.add(true);
        context.navigateNamedTo('/test');
        isLoding(false);
      } else {
        isLoding(false);
        final snackdemo = SnackBar(
          width: double.infinity,
          content: const SizedBox(
              height: 15,
              child: Center(
                child: Text('something went wrong...!'),
              )),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }
  }
}
