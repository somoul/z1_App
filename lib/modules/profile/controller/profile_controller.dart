// ignore_for_file: await_only_futures, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/profile_model.dart';


class ProfileController extends GetxController {
     ProfileModel profileModel = ProfileModel();
  // CollectionReference student = FirebaseFirestore.instance.collection('user');

  getDataProfile() async {
    FirebaseFirestore.instance
        .collection('user')
        .doc("YHpfJ9UOw7dSbHtjwDWmbdC3FkI2")
        .get()
        .then((value) async {
         profileModel = ProfileModel.fromJson(value.data() as Map<String,dynamic>);
        //  value.
      debugPrint("1111-------------> 1111 value :${profileModel} ");
    });
  
//  var collection = FirebaseFirestore.instance.collection('user');
//     var querySnapshot = await collection.get();
//     for (var queryDocumentSnapshot in querySnapshot.docs) {
//       Map<String, dynamic> data = queryDocumentSnapshot.data();

//       debugPrint(' ======11111 :${data}');
//       // String name=data['last_name'];
//       // profileModel.last_name==data['last_name'];
//       // profileModel.copyWith(data.length);
//       // profileModel=data['pincode'];
//        debugPrint(' =====22222 :${data}');
      
      // if (pincode == data['pincode']) {
      //   //_verificationNotifier.add(true);/"",
          
      //   context.navigateNamedTo("");
      //   // context.navigateNamedTo('/test');
      //   isLoding(false);
      // } else {
      //   isLoding(false);
       
      //   ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      // }
    //}



}}