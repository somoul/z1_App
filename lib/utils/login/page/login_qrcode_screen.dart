// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controller/login_controller.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:z1_app/widgets/custom_buttom.dart';

class LoginQrCodeScreen extends StatelessWidget {
  const LoginQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    QRViewController? _qrViewController;
    final cameraController = MobileScannerController();
    bool? isFlashOn = false;
    debugPrint('====== Show cameraController :$cameraController====');
    
    return Scaffold(
        appBar: null,
        backgroundColor: Colors.blueAccent.withOpacity(0.5),
        // Colors.blueAccent.withOpacity(0.8),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                  top: kIsWeb ? 20 : 55,
                  right: 10,
                  child: GestureDetector(
                      onTap: () {
                        debugPrint('=======Show test SiginScreen===');
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: kIsWeb ? 240 : 240,
                                    right: 25,
                                    bottom: kIsWeb ? 720 : 690,
                                    top: 50),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.blueAccent,
                                            blurRadius: 0.2,
                                            spreadRadius: 0.2)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // cameraController.dispose();
                                          context
                                              .navigateNamedTo('signInScreen');
                                          context.popRoute();
                                        },
                                        child: Text(
                                          'Login',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: kIsWeb ? 15 : 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider(
                                        height: 10,
                                        thickness: 3,
                                        // indent: 20,
                                        //endIndent: 0,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Pincode',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontSize: kIsWeb ? 15 : 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              );
                           
                            });
                      },
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 35,
                      ))
                  
                  ),

              Center(
                child: SizedBox(
                  height: // kIsWeb ? 248 :
                      248.3,
                  width: //kIsWeb ? 260 :
                      260.5,
                  child: MobileScanner(
                    allowDuplicates: false,
                    controller: cameraController,
                    onDetect: (barcode, args) {
                      loginController.linkScranQRCode.value = barcode.rawValue!;
                   

                      debugPrint('Barcode found! 111 : ${barcode.rawValue!}');
                      loginController.linkScranQRCode.value.isNotEmpty
                          ? context.navigateNamedTo('/test')
                          : Container();
                      // Timer(
                      //   const Duration(seconds: 1),
                      //   () {
                      //     // context.router.navigateBack();
                      //     loginController.linkScranQRCode.value.isNotEmpty
                      //         ? cameraController.dispose()
                      //         : Container();
                      //   },
                      // );
                    },
                  ),
                ),
              ),
              QRScannerOverlay(
                overlayColour: Colors.red.withOpacity(0.5),
              ),
              Positioned(
                left: 15,
                right: 15,
                top: kIsWeb
                    ? 205
                    : Platform.isIOS
                        ? 215
                        : 170,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Scan QR Code',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 21,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        //  Theme.of(context).textTheme.bodyText1!.copyWith(
                        //       fontSize: 22,
                        //       fontFamily: 'SFPRODISPLAYBOLD',
                        //       //fontWeight: FontWeight.w700,
                        //       color: Colors.white.withOpacity(0.9),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Text(
                        'Align QR code within the frame to login',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: kIsWeb
                    ? 150
                    : Platform.isIOS
                        ? 150
                        : 100,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _qrViewController!.toggleFlash();
                        //  setState(() {
                        isFlashOn = !isFlashOn!;
                        // });
                      },
                      child: SvgPicture.asset(
                        isFlashOn == true
                            ? 'asset/image/image_svg/flash.svg'
                            : 'asset/image/image_svg/flash.svg',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Flash',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: Colors.white70.withOpacity(0.9),
                            fontFamily: 'SFPRODISPLAYREGULAR',
                          ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //     left: 20,
              //     bottom: 50,
              //     child: Obx(
              //       () => GestureDetector(
              //         onTap: () {
              //           launchUrl(
              //               Uri.parse(''
              //                 //scanQrController.linkScranQRCode.value
              //                 ));
              //         },
              //         child: RichText(
              //           text: TextSpan(
              //             text:
              //                 scanQrController.linkScranQRCode.value.isNotEmpty
              //                     ? 'link url : '
              //                     : '',
              //             style: const TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 14,
              //                 color: Colors.white),
              //             children: <TextSpan>[
              //               TextSpan(
              //                   text: scanQrController
              //                           .linkScranQRCode.value.isNotEmpty
              //                       ? scanQrController.linkScranQRCode.value
              //                       : '',
              //                   style: const TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 14,
              //                       color: Colors.white)),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ))
            ],
          ),
        ));
  }
}

class QRScannerOverlay extends StatefulWidget {
  const QRScannerOverlay({Key? key, required this.overlayColour})
      : super(key: key);

  final Color overlayColour;

  @override
  State<QRScannerOverlay> createState() => _QRScannerOverlayState();
}

class _QRScannerOverlayState extends State<QRScannerOverlay> {
  // QRViewController? qrViewController;
  bool? isScanner = false;

  // @override
  // void dispose() {
  //   qrViewController!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 215.0
        : 330.0;
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: CustomPaint(
          size: const Size.fromRadius(100),
          foregroundPainter: BorderPainter(),

          // backgroundColor:Colors.red,
          child: SizedBox(
            // width: scanArea + 56.5,
            // height: scanArea + 47.09,
            width: kIsWeb
                ? scanArea + 58.5
                : Platform.isIOS
                    ? scanArea - 55
                    : scanArea + 56.5,
            height: kIsWeb
                ? scanArea + 47.5
                : Platform.isIOS
                    ? scanArea - 65
                    : scanArea + 47.09,
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders Qrcode
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.7;

    const radius = 13.0;
    const tRadius = 3 * radius;

    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(13));
    const clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
