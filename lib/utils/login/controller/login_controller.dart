// ignore_for_file: unused_label, use_build_context_synchronously, prefer_const_declarations

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  // final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  // final _profileController = Get.put(ProfileController());
  // final _homeController = Get.put(HomeController());
  Future login(String email, password, BuildContext context) async {
    isLoding(true);
    try {
      // debugPrint('00====== Token1111 :');
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        // var collection = FirebaseFirestore.instance.collection('user');
        // var querySnapshot = await collection.get();
        // for (var queryDocumentSnapshot in querySnapshot.docs) {
        //   Map<String, dynamic> data = queryDocumentSnapshot.data();
        //   if (value.user!.uid == data['token']) {
        //     _homeController.bree.value = data['bree'];
        //     _homeController.bree_token.value = data['bree_token'];
        //     debugPrint(
        //         '==========bree  : ${_homeController.bree.value}. ==bree_token: ${_homeController.bree_token.value}. ');

        //     // _profileController.getDataProfile(stoToken.value);

        //   }
        // }

        // debugPrint('00====== Token : ${value}');
        await LocalData.storeCurrentUser(value.user!.uid);
        context.navigateNamedTo('pinCodeScreen');
        // context.navigateNamedTo("");
      });

      debugPrint(' =====Login Scceass True :==== 22222222');

      isLoding(false);
    } catch (e) {
      debugPrint(' ===== Something went wrong flase====$e');

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
