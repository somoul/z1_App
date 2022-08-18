// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, invalid_use_of_protected_member, deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../widgets/custom_default_size_web.dart';
import '../../../widgets/home/custom_cart.dart';
import '../../controler_bottom_bar.dart/controller_bar.dart';
import '../../scan_qp_code/scan_qr_code_screen.dart';
import '../controler/home_comtroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cameraController = MobileScannerController();
    final _homeController = Get.put(HomeController());
    final _bottomBarController = Get.put(BottomBarController());
    return CustomDefaultSizeWeb(
        child: Scaffold(
            backgroundColor:
                Colors.white, //AppColor.backgroundColor, // Colors.black,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: AppColor.buttonColor.withOpacity(0.8),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 1,
                    right: 5,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      cameraController.start();
                      cameraController.switchCamera();
                      //context.navigateNamedTo('loginQrCodeScreen');
                      // context.navigateBack();
                      // loginController.linkScranQRCode.value = '';
                      // context.navigateBack();
                      // context.navigateNamedTo('loginQrCodeScreen');
                      //  context.navigateNamedTo('scanqrcodesceen');
                    },
                    child: Image.asset(
                      'asset/image/image_png/qr_code.png',
                      width: 63,
                      height: 61,
                    ),
                  ),
                ),
              ],
              leading: Container(),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: Obx(() => _homeController.isLoding.value
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
                : GridView.builder(
                    itemCount: _homeController.homeListModel.value.length,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                        left: 18, right: 23, bottom: 130, top: 125),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 18,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCart(
                          title: _homeController
                              .homeListModel.value[index].app_name,
                          image: _homeController
                              .homeListModel.value[index].link_image,
                          colors: _homeController
                              .homeListModel.value[index].app_color,
                          onTap: () async {
                            String url =
                                '${_homeController.homeListModel[index].app_link}';
                            // "https://online-quiz-75798.firebaseapp.com";
                            if (await canLaunch(url)) {
                              await launch(url,
                                  forceSafariVC: true,
                                  forceWebView: true,
                                  enableJavaScript: true);
                            }
                          });
                      // Container(
                      //   height: 50,width: 50,
                      //   decoration: BoxDecoration(
                      //     color: Colors.red,
                      //    // image:DecorationImage(image:NetworkImage(_homeModel.urlImage.toString()))
                      //   ),
                      //   child: Text('${_homeController.homeListModel[index].app_name}'),
                      //   );//CustomCart();
                    }))));
  }
}
