// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, deprecated_member_use, invalid_use_of_protected_member

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/app_model/app_models.dart';

class HomeController extends GetxController {
  final homeListModel = <HomeModel>[].obs;

  final listApp = HomeModel().obs;
  final isLoding = false.obs;
  final listAppuse = ''.obs;
  List<DocumentSnapshot<HomeModel>> results = [];
  getApplist() {
    isLoding(true);
    homeListModel.value.clear();
    FirebaseFirestore.instance
        .collection('chip_app')
        .doc("o4dykIEJQzg3AoZ1rqOk")
        .get()
        .then((value) async {
      value.data()![listAppuse.value].map(
        (e) {
          debugPrint("------------->hello");

          var item = HomeModel.fromJson(e);
          homeListModel.value.add(item);
        },
      ).toList();

      debugPrint("------------->hello list = ${homeListModel.length}");

      debugPrint("list  : $homeListModel");
      isLoding(false);
    }).onError((error, stackTrace) {
      debugPrint("#####_-------> ${error.toString()}");
      isLoding(false);
    });
  }
}
