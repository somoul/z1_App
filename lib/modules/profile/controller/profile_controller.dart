// ignore_for_file: await_only_futures, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/profile_model.dart';


class ProfileController extends GetxController {
     final profileModel = ProfileModel().obs;
      final isLoading=false.obs;
  getDataProfile() async {
    isLoading(true);
    FirebaseFirestore.instance
        .collection('user')
        .doc("YHpfJ9UOw7dSbHtjwDWmbdC3FkI2")
        .get()
        .then((value) async {
         profileModel.value = ProfileModel.fromJson(value.data() as Map<String,dynamic>);
        //  value.
      debugPrint("1111-------------> 1111 value :${profileModel} ");
          isLoading(false);
    });
  



}}