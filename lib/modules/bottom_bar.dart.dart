// ignore_for_file: deprecated_member_use, prefer_const_declarations, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:z1_app/configs/app_constant.dart';
import 'package:z1_app/utils/app_color/app_colors.dart';

import '../configs/router/auto_route.gr.dart';
import '../utils/home/controler/home_comtroller.dart';
import '../widgets/home/custom_cart.dart';
import 'controler_bottom_bar.dart/controller_bar.dart';

class BottomBar extends StatefulWidget {
  //BottomBar
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _homeController = Get.put(HomeController());
  // final _homeModel=HomeModel();
  int selectedindex = 1;
  @override
  void initState() {
    super.initState(); //appList
    _homeController.getApplist();
  }

  @override
  Widget build(BuildContext context) {
    final cameraController = MobileScannerController();
    final _homeController = Get.put(HomeController());

    final _bottomBarController = Get.put(BottomBarController());
    cameraController.dispose();
    return AutoTabsRouter(
        // animationDuration: const Duration(seconds: 0),
        //   resizeToAvoidBottomInset: false,
        routes: const [
          ScanQrCodeSceen(),
          HomeScreen(),
          ProfileScreen(),
        ],
        builder: (context, child, animation) {
          // obtain the scoped TabsRouter controller using context
          // final tabsRouter = AutoTabsRouter.of(context);
          // Here we're building our Scaffold inside of AutoTabsRouter
          // to access the tabsRouter controller provided in this context
          //
          //alterntivly you could use a global key
          return Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  _bottomBarController
                              .selecClickButtomNavigetionBarback.value ==
                          true
                      ? Text('')
                      : Text(''),
                  FadeTransition(
                    opacity: animation,
                    // the passed child is techinaclly our animated selected-tab page
                    child: child,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1.0,
                          sigmaY: 1.0,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 80,
                          decoration: BoxDecoration(
                            color: AppColor.buttonColor.withOpacity(
                                0.8), // Colors.black.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(defaultRadius * 2),
                              topRight: Radius.circular(defaultRadius * 2),
                            ),
                          ),
                          // alignment: Alignment.center,
                          child: SafeArea(
                            top: false,
                            minimum: const EdgeInsets.only(
                                bottom: 20, top: 15, left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                listNav.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      AutoTabsRouter.of(context)
                                          .setActiveIndex(index);

                                      selectedindex = index;
                                      //  AutoTabsRouter.of(context).setActiveIndex(index);
                                      debugPrint(
                                          '======= Index navigetion Bar : ${selectedindex}');
                                     
                                    });
                                  },
                                  child: NavigationItem(
                                    icon: listNav[index],
                                    selected: selectedindex == index,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

final listNav = <IconData>[
  CupertinoIcons.qrcode_viewfinder,
  CupertinoIcons.home,
  CupertinoIcons.profile_circled,
];

class NavigationItem extends StatelessWidget {
  final bool selected;
  final IconData icon;
  const NavigationItem({
    Key? key,
    this.selected = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(selected ? 1 : 0.1),
        shape: BoxShape.circle,
        // border: const Border(top: BorderSide()),
        boxShadow: selected
            ? const [
                BoxShadow(
                  color: Colors.white54,
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ]
            : [],
      ),
      child: Icon(
        icon,
        color: selected ? Colors.indigo[900] : Colors.white,
      ),
    );
  }
}
// bottomNavigationBar: BottomNavigationBar(
//   currentIndex: tabsRouter.activeIndex,
//   onTap: (index) {
//     // here we switch between tabs
//     tabsRouter.setActiveIndex(index);
//   },
//   items: [
//     BottomNavigationBarItem(label: 'Users',...),
//     BottomNavigationBarItem(label: 'Posts',...),
//     BottomNavigationBarItem(label: 'Settings',...),
//   ],
// )
// );

// Scaffold(
//   backgroundColor:
//       Colors.white, //AppColor.backgroundColor, // Colors.black,
//   extendBodyBehindAppBar: true,
//   appBar: AppBar(
//     backgroundColor: AppColor.buttonColor.withOpacity(0.8),
//     actions: null,
//     leading: Container(),
//     title: null,
//   ),
//   body: Obx(
//     () => Stack(
//       children: [
//         _homeController.isLoding.value ? Container() : Container(),
//         GridView.builder(
//             itemCount: _homeController.homeListModel.length,
//             scrollDirection: Axis.vertical,
//             padding: const EdgeInsets.only(
//                 left: 18, right: 23, bottom: 130, top: 125),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4,
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 18,
//               childAspectRatio: 1,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               return CustomCart(
//                   title: _homeController.homeListModel[index].app_name,
//                   image: _homeController.homeListModel[index].link_image,
//                   colors: _homeController.homeListModel[index].app_color,
//                   onTap: () async {
//                     String url =
//                         '${_homeController.homeListModel[index].app_link}';
//                     // "https://online-quiz-75798.firebaseapp.com";
//                     if (await canLaunch(url)) {
//                       await launch(url,
//                           forceSafariVC: true,
//                           forceWebView: true,
//                           enableJavaScript: true);
//                     }
//                   });
//               // Container(
//               //   height: 50,width: 50,
//               //   decoration: BoxDecoration(
//               //     color: Colors.red,
//               //    // image:DecorationImage(image:NetworkImage(_homeModel.urlImage.toString()))
//               //   ),
//               //   child: Text('${_homeController.homeListModel[index].app_name}'),
//               //   );//CustomCart();
//             }),
//         //background Image
//         // Container(
//         //   width: double.infinity,
//         //   height: double.infinity,
//         //   decoration:  BoxDecoration(
//         //     color: AppColor.backgroundColor,
//         //     // image: DecorationImage(
//         //     //   fit: BoxFit.cover,
//         //     //   image: NetworkImage(
//         //     //    //  'https://images.unsplash.com/photo-1602947605863-d464e14f06ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWJzdHJhY3QlMjBsaWdodHxlbnwwfHwwfHw%3D&w=1000&q=80'
//         //     //        'https://wallpaperaccess.com/full/1567836.jpg'
//         //     //       // 'https://cdn.wallpapersafari.com/1/39/VXsxcb.png'
//         //     //       // 'https://wallpaperaccess.com/full/2454622.jpg'
//         //     //       //'https://images.wallpapersden.com/image/download/blue-background-geometric-abstract_a2hrZ2mUmZqaraWkpJRmbmdlrWZlbWU.jpg'
//         //     //       // 'https://static.vecteezy.com/system/resources/previews/001/882/531/original/dark-blue-technology-background-free-vector.jpg'
//         //     //       // 'https://i.pinimg.com/originals/f9/99/9e/f9999e908cbd186b43b050a667291402.jpg',
//         //     //       ),
//         //     // ),
//         //   ),
//         // ),

//         // SafeArea(
//         //   bottom: false,
//         //   child: Padding(
//         //     padding: const EdgeInsets.only(
//         //         left: defaultPadding, right: defaultPadding),
//         //     child: Column(
//         //       crossAxisAlignment: CrossAxisAlignment.start,
//         //       children: [
//         //         // Text(
//         //         //   'Hello Virak!',
//         //         //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
//         //         //         fontWeight: FontWeight.w600,
//         //         //         color: Colors.white,
//         //         //       ),
//         //         // ),
//         //         // Text(
//         //         //   'Welcome to webview app',
//         //         //   style: Theme.of(context).textTheme.subtitle2!.copyWith(
//         //         //         fontWeight: FontWeight.w200,
//         //         //         color: Colors.white,
//         //         //       ),
//         //         // ),
//         //         Expanded(
//         //           child: GridView.builder(
//         //             padding: const EdgeInsets.only(
//         //               top: defaultPadding / 2,
//         //               bottom: 100 + defaultPadding,
//         //             ),
//         //             gridDelegate:
//         //                 const SliverGridDelegateWithFixedCrossAxisCount(
//         //               crossAxisSpacing: 10,
//         //               mainAxisSpacing: 10,childAspectRatio: 0.8,
//         //               crossAxisCount: 2,
//         //             ),
//         //             itemCount: 20,
//         //             itemBuilder: (BuildContext context, int index) =>
//         //                 GestureDetector(
//         //               onTap: () {
//         //                 showDialog(
//         //                   context: context,
//         //                   builder: (context) => Dialog(
//         //                     backgroundColor: Colors.transparent,
//         //                     child: Container(
//         //                       height: 200,
//         //                       width: 200,
//         //                       decoration: BoxDecoration(
//         //                         color: Colors.white,//.withOpacity(0.5),
//         //                         borderRadius:
//         //                             BorderRadius.circular(defaultRadius * 2),
//         //                       ),
//         //                     ),
//         //                   ),
//         //                 );
//         //                 // Navigator.push(
//         //                 //   context,
//         //                 //   MaterialPageRoute(
//         //                 //     builder: ((context) => MyHomePage(
//         //                 //           index: index,
//         //                 //         )),
//         //                 //   ),
//         //                 // );
//         //               },
//         //               child:
//         //               const AppCard(
//         //                 title: 'Avocado',
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         // ),

//         Positioned(
//           bottom: 0,
//           left: 0,
//           child: ClipRRect(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(
//                 sigmaX: 1.0,
//                 sigmaY: 1.0,
//               ),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 // height: 80,
//                 decoration: BoxDecoration(
//                   color: AppColor.buttonColor
//                       .withOpacity(0.8), // Colors.black.withOpacity(0.5),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(defaultRadius * 2),
//                     topRight: Radius.circular(defaultRadius * 2),
//                   ),
//                 ),
//                 // alignment: Alignment.center,
//                 child: SafeArea(
//                   top: false,
//                   minimum: const EdgeInsets.only(
//                       bottom: 20, top: 15, left: 30, right: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(
//                       listNav.length,
//                       (index) => GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedindex = index;
//                             debugPrint(
//                                 '======= Index navigetion Bar : ${selectedindex}');
//                             if (selectedindex == 0) {
//                               context.navigateNamedTo('loginQrCodeScreen');
//                             }
//                             if (selectedindex == 2) {
//                               context.navigateNamedTo('pinCodeScreen');
//                             }
//                           });
//                         },
//                         child: NavigationItem(
//                           icon: listNav[index],
//                           selected: selectedindex == index,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// );
//   }
// }

// final listNav = <IconData>[
//   CupertinoIcons.qrcode_viewfinder,
//   CupertinoIcons.home,
//   CupertinoIcons.profile_circled,
// ];

// class NavigationItem extends StatelessWidget {
//   final bool selected;
//   final IconData icon;
//   const NavigationItem({
//     Key? key,
//     this.selected = false,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       curve: Curves.fastOutSlowIn,
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(selected ? 1 : 0.1),
//         shape: BoxShape.circle,
//         // border: const Border(top: BorderSide()),
//         boxShadow: selected
//             ? const [
//                 BoxShadow(
//                   color: Colors.white54,
//                   spreadRadius: 4,
//                   blurRadius: 10,
//                 ),
//               ]
//             : [],
//       ),
//       child: Icon(
//         icon,
//         color: selected ? Colors.indigo[900] : Colors.white,
//       ),
//     );
//   }
// }
