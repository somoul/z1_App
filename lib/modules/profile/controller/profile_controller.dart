// ignore_for_file: await_only_futures, unused_local_variable, non_constant_identifier_names
import 'package:get/get.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  final profileModel = ProfileModel().obs;
  final isLoading = false.obs;
  final token = ''.obs;
  final imageProfile = ''.obs;
}
