// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../modules/home/controler/home_comtroller.dart';
import '../app_color/app_colors.dart';

class MiniAppScreen extends StatefulWidget {
  final String? linkApp;
  const MiniAppScreen({Key? key, this.linkApp}) : super(key: key);

  @override
  State<MiniAppScreen> createState() => _MiniAppScreenState();
}

class _MiniAppScreenState extends State<MiniAppScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      if (Platform.isAndroid) WebView.platform = AndroidWebView();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: '${widget.linkApp}',
      ),
    );
  }
}
