// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/passcode_screen.dart';
import '../../app_color/app_colors.dart';
import '../controller/pincode_controller.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StreamController<bool> _verificationNotifier =
        StreamController<bool>.broadcast();
    // Timer? timer;
    final _pinCodeController = Get.put(PinCodeController());
    // int time = 30;
    int numberLoginPassCode = 1;
    // int numberTimmerDelayed = 30;
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: [
            PasscodeScreen(
              title: Text(
                'Enter your passcode',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              passwordEnteredCallback: (pincode) {
                debugPrint('======== show PinCode :$pincode===========');
                if (pincode == '1234') {
                  _verificationNotifier.add(true);
                  context.navigateNamedTo('/test');
                } else {
                  _verificationNotifier.add(false);
                  _pinCodeController.numberLoginPassCode.value =
                      numberLoginPassCode++;

                  debugPrint(
                      'Show Number LoginPasscode : ${_pinCodeController.numberLoginPassCode.value}');
                  if (_pinCodeController.numberLoginPassCode.value > 3) {
                    numberLoginPassCode = 1;
                    _pinCodeController.numberTimmerDelayed.value =
                        _pinCodeController.time.value;
                    Timer.periodic(
                      const Duration(seconds: 1),
                      (Timer timer) {
                        if (_pinCodeController.time.value >= 0) {
                          _pinCodeController.numberTimmerDelayed.value =
                              _pinCodeController.time.value--;
                        } else {
                          _pinCodeController.numberLoginPassCode.value = 0;
                          _pinCodeController.time.value = 15;
                          timer.cancel();
                        }

                        debugPrint(
                            ' ======= Show  time :${_pinCodeController.time.value - 1}====');

                        debugPrint(
                            ' ======= Show numberTimmerDelayed  :${_pinCodeController.numberTimmerDelayed.value}====');
                      },
                    );
                  }
                }
              },
              circleUIConfig: const CircleUIConfig(
                  borderColor: Colors.white,
                  fillColor: Colors.white,
                  circleSize: 22),
              cancelCallback: () {
                context.navigateBack();
              },
              cancelButton: Text(
                'Cancel',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              deleteButton: Text(
                'Delete',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              shouldTriggerVerification: _verificationNotifier.stream,
              backgroundColor: AppColor.backgroundColor,
              passwordDigits: 4,
            ),
            _pinCodeController.numberLoginPassCode.value > 3
                ? Positioned(
                    child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.75),
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'This  device is lockes ',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                        ),
                       const SizedBox(height: 3,),
                        Text(
                          'please try again in  ${_pinCodeController.numberTimmerDelayed.value} seconds',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.blue,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                  ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
