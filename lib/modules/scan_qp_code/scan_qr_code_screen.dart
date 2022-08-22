import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/login/controller/login_controller.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../controllers/scanqr_controller.dart';

class ScanQrCodeSceen extends StatefulWidget {
  const ScanQrCodeSceen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeSceen> createState() => _ScanQrCodeSceenState();
}

final loginController = Get.put(LoginController());
QRViewController? _qrViewController;
final cameraController = MobileScannerController();
bool? isFlashOn = false;
// debugPrint('====== Show cameraController :$cameraController====');

// bool? isFlashOn = false;

class _ScanQrCodeSceenState extends State<ScanQrCodeSceen> {
  // @override
  // void initState() {
  //   cameraController.start();
  //   cameraController.switchCamera();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.buttonColor.withOpacity(0.8),
          actions: null,
          leading: Container(),
          title: Text(
            'Qrcode',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Colors.white, // AppColor.backgroundColor,
        body: Center(
          child:Obx(()=> Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               loginController.linkScranQRCode.value!=null?  Text('Qrcode :${ loginController.linkScranQRCode.value}'):Text(''),
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: // kIsWeb ? 248 :
                              265.3,
                          width: //kIsWeb ? 260 :
                              274,
                          child: MobileScanner(
                            allowDuplicates: false,
                            controller: cameraController,
                            onDetect: (barcode, args) {
                              loginController.linkScranQRCode.value =
                                  barcode.rawValue!;

                              debugPrint(
                                  'Barcode found! 111 : ${barcode.rawValue!}');
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: QRScannerOverlay(
                          overlayColour: Colors.red.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _qrViewController!.toggleFlash();
                        //  setState(() {
                        isFlashOn = !isFlashOn!;
                        // });
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            // color: Colors.blue.shade100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.shade100,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 1,
                                      spreadRadius: 1.5)
                                ]),

                            child: Center(
                              child: SvgPicture.asset(
                                isFlashOn == true
                                    ? 'asset/image/image_svg/flash.svg'
                                    : 'asset/image/image_svg/flash.svg',
                                height: 45,
                                width: 45,
                              ),
                            ),
                          )
                        ],
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
                            color: Colors.black.withOpacity(0.9),
                            fontFamily: 'SFPRODISPLAYREGULAR',
                          ),
                    ),
                  ],
                ),
              ],
            ),
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
        ? 343.0
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
    const width = 4.8;

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
        ..color = Colors.blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
