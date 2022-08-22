import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
class QrcodeScreen extends StatelessWidget {
  const QrcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      ),
    );
  }
}