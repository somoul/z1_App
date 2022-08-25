// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, deprecated_member_use, invalid_use_of_protected_member
import 'package:get/get.dart';

import '../model/app_model/app_models.dart';

class HomeController extends GetxController {
  final homeListModel = <HomeModel>[].obs;
  final listApp = HomeModel().obs;
  final isLoding = false.obs;
  final bree = ''.obs;
  final bree_token = ''.obs;

  final isLodingminiApp = false.obs;
}
