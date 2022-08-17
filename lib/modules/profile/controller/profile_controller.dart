// ignore_for_file: await_only_futures, unused_local_variable, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/profile_model.dart';

class ProfileController extends GetxController {
  final profileModel = ProfileModel().obs;
  final isLoading = false.obs;
  getDataProfile(String tokenId) async {
    isLoading(true);
    FirebaseFirestore.instance
        .collection('user')
        .doc(tokenId)
        .get()
        .then((value) async {
      debugPrint("Response Body:${value.data()}");

      profileModel.value =
          ProfileModel.fromJson(value.data() as Map<String, dynamic>);

      debugPrint("1111-------------> 1111 value :${profileModel} ");
      isLoading(false);
    });
  }
}
