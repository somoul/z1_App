// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, unrelated_type_equality_checks

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_color/app_colors.dart';
import '../controller/login_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginController = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    final _emailTextEditingController = TextEditingController();
    final _passwordTextEditingController = TextEditingController();

    return Scaffold(
      appBar: null,
      backgroundColor: const Color(0xffF1F3F6),
      body: Obx(
        () => Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xffF2F4FA),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height:kIsWeb?140: 170,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.white70)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome!',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontSize: 28,
                                        color: AppColor.descriptionColor,
                                        fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Sign in and get started',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const Spacer(),//scanqrcodesceen
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom:kIsWeb?50: 33, right: 5,),
                            child: GestureDetector(
                              onTap: () {
                                 context.navigateNamedTo('loginQrCodeScreen'); 
                                //  context.navigateNamedTo('scanqrcodesceen');
                              },
                              child: Image.asset(
                                'asset/image/image_png/qr_code.png',
                                width: 63,
                                height: 63,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                            controller: _emailTextEditingController,
                            onChanged: (email) {
                              _loginController
                                  .emailTextEditingController.value = email;
                              _loginController.isObscureTextEmail.value =
                                  email == '';
                              _loginController.isEmailValid.value = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email);
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter your Email',
                              hintText: "Enter your Email",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColor.descriptionColor
                                        .withOpacity(0.4),
                                    width: 1.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColor.descriptionColor
                                        .withOpacity(0.5),
                                    width: 1.8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 23, horizontal: 23),
                            )),
                        const SizedBox(
                          height: 7,
                          width: 2,
                        ),
                        _loginController.isObscureTextEmail.value
                            ? Row(
                                children: [
                                  const Icon(
                                    Icons.info_rounded,
                                    size: 20,
                                    color: Color(0xFFEB252A),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'Please! Input correct email.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Colors.red, fontSize: 14),
                                  )
                                ],
                              )
                            : Text('')
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 22),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _passwordTextEditingController,
                          obscureText:
                              _loginController.isCheckClick.value != true,
                          onChanged: (password) {
                            _loginController.isObscureTextPassword.value =
                                password == '';
                            _loginController
                                .passWordTextEditingController.value = password;
                          },
                          decoration: InputDecoration(
                            labelText: 'Enter your Password',
                            hintText: "Enter your Password",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: AppColor.descriptionColor
                                      .withOpacity(0.4),
                                  width: 1.8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: AppColor.descriptionColor
                                      .withOpacity(0.5),
                                  width: 1.8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 23, horizontal: 23),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                          width: 2,
                        ),
                        _loginController.isObscureTextPassword.value
                            ? Row(
                                children: [
                                  const Icon(
                                    Icons.info_rounded,
                                    size: 20,
                                    color: Color(0xFFEB252A),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'Please! Input correct password.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Colors.red, fontSize: 14),
                                  )
                                ],
                              )
                            : Text('')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 23, right: 23, bottom: 20, top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_loginController.isCheckClick.value == false) {
                              _loginController.isCheckClick.value = true;
                            } else {
                              _loginController.isCheckClick.value = false;
                            }

                            debugPrint(
                                '====Show debug  isCheckClick : ${_loginController.isCheckClick.value}');
                          },
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                                color: AppColor.buttonColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: _loginController.isCheckClick.value
                                ? const Center(
                                    child: Icon(Icons.check,
                                        size: 16, color: Colors.white))
                                : null,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Center(
                          child: Text(
                            "Remember me",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: AppColor.descriptionColor,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.navigateNamedTo('/test');
                          },
                          child: Center(
                            child: Text(
                              'Pin code',
                              // "Forgot Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: AppColor.descriptionColor,
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _loginController.isEmailValid.value &&
                                _loginController
                                        .emailTextEditingController.value !=
                                    ''
                            ? _loginController.isObscureTextEmail.value = false
                            : _loginController.isObscureTextEmail.value = true;
                        _loginController.passWordTextEditingController.value
                                    .length >=
                                8
                            ? _loginController.isObscureTextPassword.value =
                                false
                            : _loginController.isObscureTextPassword.value =
                                true;

                        if (_loginController.isObscureTextPassword.value ==
                                false &&
                            _loginController.isObscureTextEmail.value ==
                                false) {
                          context.navigateNamedTo('/test');
                        } else {}
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.buttonColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Center(
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Don't have an account ? ",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 16,
                                    color: AppColor.descriptionColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Register here",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 16,
                                    color: AppColor.descriptionColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                ]),
          ),
        ),
      ),
    );
  }
}
