// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'dart:async';
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
  final _homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
         _homeController.isLodingminiApp.value = true;
    Timer(const Duration(seconds: 5), () {
      _homeController.isLodingminiApp.value = false;
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
      body: Obx(
        () => _homeController.isLodingminiApp.value
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 5.0,
                    color: Color.fromARGB(255, 101, 201, 226),
                  ),
                ),
              )
            : WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: '${widget.linkApp}',
              ),
      ),
    );
  }
}
