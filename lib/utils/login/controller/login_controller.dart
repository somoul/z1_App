import 'package:get/get.dart';

class LoginController extends GetxController {
  final isCheckClick = false.obs;
  final isObscureTextEmail = false.obs;
  final isEmailValid = true.obs;
  final emailTextEditingController = ''.obs;
  final passWordTextEditingController = ''.obs;

  final isObscureTextPassword = false.obs;
  final linkScranQRCode=''.obs;
}
