import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../controllers/scanqr_controller.dart';

class ScanQrCodeSceen extends StatefulWidget {
  const ScanQrCodeSceen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeSceen> createState() => _ScanQrCodeSceenState();
}

class _ScanQrCodeSceenState extends State<ScanQrCodeSceen> {
  // final scanQrController = Get.put(ScanQrController());
 // final cameraController = MobileScannerController();
  bool? isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: const Color(0xFF49585F),
        //   leading: IconButton(
        //     color: Colors.white,
        //     icon: const Icon(Icons.clear),
        //     onPressed: () {
        //       context.router.navigateBack();
        //     },
        //     // size: 21,
        //     iconSize: 21,
        //   ),
        // ),
        appBar: null,
        backgroundColor: const Color(0xFF49585F),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black12,
        ));
    // Center
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         left: 10,
    //         top: 20,
    //         child: IconButton(
    //           // Icons.clear,
    //           color: Colors.white,
    //           icon: const Icon(Icons.clear),
    //           onPressed: () {
    //             context.router.navigateBack();
    //             //Navigator.pop(context);
    //           },
    //           // size: 21,
    //           iconSize: 21,
    //         ),
    //       ),
    //       Center(
    //         child: SizedBox(
    //           height: 227.7,
    //           width: 227.5,
    //           child: MobileScanner(
    //             allowDuplicates: true,
    //             controller: cameraController,
    //             onDetect: (barcode, args) {
    //               // scanQrController.linkScranQRCode.value =
    //               //     barcode.rawValue!;
    //               debugPrint('Barcode found! 111 : ${barcode.rawValue!}');
    //               Timer(
    //                 const Duration(seconds: 1),
    //                 () {
    //                   // context.router.navigateBack();
    //                 },
    //               );
    //             },
    //           ),
    //         ),
    //       ),
    //       QRScannerOverlay(
    //         overlayColour: Colors.red.withOpacity(0.5),
    //       ),
    //       Positioned(
    //         left: 15,
    //         right: 15,
    //         top: 220,
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text(
    //                 'Scan QR Code',
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context).textTheme.bodyText1!.copyWith(
    //                       fontSize: 22,
    //                       fontFamily: 'SFPRODISPLAYBOLD',
    //                       //fontWeight: FontWeight.w700,
    //                       color: Colors.white.withOpacity(0.9),
    //                     ),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Text(
    //                 'Align QR code within the frame to scan',
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context).textTheme.bodyText1!.copyWith(
    //                       fontSize: 16,
    //                       // fontWeight: FontWeight.w700,
    //                       fontFamily: 'SFPRODISPLAYREGULAR',
    //                       color: Colors.white.withOpacity(0.9),
    //                     ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 0,
    //         right: 0,
    //         bottom: 170,
    //         child: Column(
    //           children: [
    //             GestureDetector(
    //               onTap: () {
    //                 setState(() {
    //                   isFlashOn = !isFlashOn!;
    //                 });
    //               },
    //               child: SvgPicture.asset(
    //                 isFlashOn == true
    //                     ? 'assets/svg/flash.svg'
    //                     : 'assets/svg/flash.svg',
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 10,
    //             ),
    //             Text(
    //               'Flash',
    //               textAlign: TextAlign.center,
    //               style: Theme.of(context).textTheme.bodyText1!.copyWith(
    //                     fontSize: 14,
    //                     color: Colors.white70.withOpacity(0.9),
    //                     fontFamily: 'SFPRODISPLAYREGULAR',
    //                   ),
    //             ),
    //           ],
    //         ),
    //       ),

    //     ],
    //   ),
    // ));
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
  bool? isScanner = false;
  @override
  void initState() {
    isScanner = true;

    super.initState();
  }

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
            width: scanArea + 24.5,
            height: scanArea + 24.5,
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
    const width = 3.8;

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
