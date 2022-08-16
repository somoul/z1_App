import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/home/controler/home_comtroller.dart';
import '../../../widgets/custom_default_size_web.dart';
import '../../../widgets/home/custom_cart.dart';
import '../../controler_bottom_bar.dart/controller_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final cameraController = MobileScannerController();
    final _homeController = Get.put(HomeController());
    final _bottomBarController=Get.put(BottomBarController());
    return CustomDefaultSizeWeb(
      child: Scaffold(
      backgroundColor:
          Colors.white, //AppColor.backgroundColor, // Colors.black,
      extendBodyBehindAppBar: true,
      appBar: 
      AppBar(
        backgroundColor: AppColor.buttonColor.withOpacity(0.8),
        actions: null,
        leading: Container(),
        title: null,
      ),
      body:  Obx(
        () => Stack(
          children: [
            _homeController.isLoding.value ? Container() : Container(),
            GridView.builder(
                itemCount: _homeController.homeListModel.length,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                    left: 18, right: 23, bottom: 130, top: 125),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 18,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CustomCart(
                      title: _homeController.homeListModel[index].app_name,
                      image: _homeController.homeListModel[index].link_image,
                      colors: _homeController.homeListModel[index].app_color,
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
                }),
          ]
    ))));
  }
}
