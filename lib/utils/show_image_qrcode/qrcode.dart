import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';

class QrcodeScreen extends StatelessWidget {
  const QrcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // /backgroundColor: Colors.white.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: AppColor.buttonColor.withOpacity(0.8),
        leading: IconButton(
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Positioned(
              top: 70,
              left: 120,
              child: Container(
                height: 130,
                width: 135,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(60)),
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: Stack(
              children: [
                QRScannerOverlay(
                  overlayColour: Colors.red.withOpacity(0.5),
                ),
                Positioned(
                  left: 2,
                  top: 180,
                  bottom: 0,
                  right: 2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png',
                          alignment: Alignment.center,
                          height: 300,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    top: 462,
                    left: 140,
                    child: Center(child: Text('@SOmoulAbraham'))),
              ],
            ),
          ),
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 343.0
        : 330.0;
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 0.1, spreadRadius: 0.2, color: Colors.black12)
            ]),
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
                    ? scanArea
                    : scanArea + 56.5,
            height: kIsWeb
                ? scanArea + 47.5
                : Platform.isIOS
                    ? scanArea + 35
                    : scanArea + 47.09,
          ),
        ),
      ),
    );
  }
}

// Creates the white borders Qrcode
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 5.2;

    const radius = 100.0;
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
