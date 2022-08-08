// ignore_for_file: unused_label, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app_color/app_colors.dart';

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
  // CollectionReference users =
  //     FirebaseFirestore.instance.collection('user_test');
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  Future login(String email, password, BuildContext context) async {
    isLoding(true);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (contex) => TestComponent(),
      // ));
      context.navigateNamedTo('/test');
      debugPrint(' =====Login Scceass True :==== 22222222');

      isLoding(false);
    } catch (firebaseAuthException) {
      debugPrint(' ===== Something went wrong flase====$firebaseAuthException');
      // debugPrint("User Name:$email");
      // debugPrint("User Password:$password");
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

  // FutureBuilder<DocumentSnapshot>(
  //   future: users.doc('98lHBQAz9HgoR6kRMZjB').get(),
  //   builder:
  //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //     if (snapshot.hasError) {
  //       return Text("Something went wrong");
  //     }
  //     if (snapshot.connectionState == ConnectionState.done) {
  //       Map<String, dynamic> data =
  //           snapshot.data!.data() as Map<String, dynamic>;
  //       debugPrint(' ===== Show data firebase : $data====');
  //     }

  //     return Text("loading");
  //   },
  // );
  // }

//   FutureBuilder<DocumentSnapshot> (
//       future: users.doc('
// 98lHBQAz9HgoR6kRMZjB').get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("Full Name: ${data['full_name']} ${data['last_name']}");
//         }

//         return Text("loading");
//     },
//     );

}
