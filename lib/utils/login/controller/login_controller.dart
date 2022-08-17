// ignore_for_file: unused_label, use_build_context_synchronously, prefer_const_declarations

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../modules/profile/controller/profile_controller.dart';
import '../../stolocal_data/local_data.dart';

class LoginController extends GetxController {
  final isCheckClick = false.obs;
  final isObscureTextEmail = false.obs;
  final isEmailValid = true.obs;
  final emailTextEditingController = ''.obs;
  final passWordTextEditingController = ''.obs;

  final isObscureTextPassword = false.obs;
  final linkScranQRCode = ''.obs;
  final isLoding = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _profileController = Get.put(ProfileController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  Future login(String email, password, BuildContext context) async {
    isLoding(true);
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        _profileController.getDataProfile(value.user!.uid);
        debugPrint(' ====== Token :${value.user!.uid}');
        LocalData.storeCurrentUser(value.user!.uid);
        context.navigateNamedTo("");
      });

      debugPrint(' =====Login Scceass True :==== 22222222');

      isLoding(false);
    } catch (firebaseAuthException) {
      debugPrint(' ===== Something went wrong flase====$firebaseAuthException');

      isLoding(false);
      final snackdemo = SnackBar(
        width: double.infinity,
        //  padding:EdgeInsets.only(top: 10,bottom: 10),
        content: const SizedBox(
            height: 15,
            child: Center(
              child: Text('something went wrong...!'),
            )),
        backgroundColor: Colors.blue[300],
        // elevation: 15,
        behavior: SnackBarBehavior.floating,

        //margin: EdgeInsets.all(1),
        duration: const Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    }
  }
}
