import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool doo = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  // MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         cameraController.cameraFacingState;
            //         // cameraController.facing;
            //       },
            //       icon: const Icon(
            //         Icons.image_rounded,
            //         color: Colors.black,
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         doo = !doo;
            //         setState(() {});
            //       },
            //       icon: const Icon(Icons.flip_camera_ios_rounded,
            //           color: Colors.black),
            //     ),
            //     IconButton(
            //       onPressed: () {},
            //       icon:
            //           const Icon(Icons.flash_off_rounded, color: Colors.black),
            //     ),
            //   ],
            // ),
            // Expanded(
            //   child: Stack(
            //     alignment: Alignment.center,
            //     children: [
            //       Container(
            //         height: width * 0.65,
            //         width: width * 0.65,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           // color: Colors.red,
            //         ),
            //         child: MobileScanner(
            //           allowDuplicates: true,
            //           controller: cameraController,
            //           onDetect: (barcode, args) {
            //             // scanQrController.linkScranQRCode.value =
            //             //     barcode.rawValue!;
            //             debugPrint('Barcode found! 111 : ${barcode.rawValue!}');
            //             // Timer(
            //             //   const Duration(seconds: 1),
            //             //   () {
            //             //     // context.router.navigateBack();
            //             //   },
            //             // );
            //           },
            //         ),
            //       ),
            //       SizedBox(
            //         height: width * 0.7,
            //         width: width * 0.7,
            //         child: const CustomPaint(
            //             // painter: BorderPainter(),
            //             ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(right: 26, bottom: 8),
            //         child: SizedBox(
            //           height: width * 0.9,
            //           width: width * 0.9,
            //           // child: Lottie.asset('asset/lottie/scan_animation.json',
            //           // animate: doo),
            //         ),
            //       ),
            //       SizedBox(
            //         height: width * 0.8,
            //         width: width * 0.8,
            //         // child: Lottie.network(
            //         //   'https://assets7.lottiefiles.com/packages/lf20_UB33eP.json',
            //         //   animate: false,
            //         // ),
            //         child: Lottie.asset('asset/lottie/dot_scan.json',
            //             animate: doo),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //   decoration: BoxDecoration(
            //     color: Colors.black87,
            //     borderRadius: BorderRadius.circular(100),
            //     // boxShadow: const [
            //     //   BoxShadow(
            //     //       color: Colors.black12, spreadRadius: 1, blurRadius: 8),
            //     // ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           cameraController.stop();
            //         },
            //         icon: const Icon(
            //           Icons.image_rounded,
            //           color: Colors.white,
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {
            //           cameraController.switchCamera();
            //         },
            //         icon: const Icon(Icons.flip_camera_ios_rounded,
            //             color: Colors.white),
            //       ),
            //       IconButton(
            //         onPressed: () {
            //           cameraController.toggleTorch();
            //         },
            //         icon: const Icon(Icons.flash_off_rounded,
            //             color: Colors.white),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

// Creates the white borders Qrcode
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 3.8;

    const radius = 12.0;
    const tRadius = 3 * radius;

    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(10));
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
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
