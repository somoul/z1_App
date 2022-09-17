// // ignore_for_file: deprecated_member_use, prefer_const_declarations, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, prefer_const_constructors

// import 'dart:ui';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:z1_app/configs/theme/app_constant.dart';
// import 'package:z1_app/utils/app_color/app_colors.dart';


// import 'controler_bottom_bar.dart/controller_bar.dart';
// import 'home/controler/home_comtroller.dart';

// class BottomBar extends StatefulWidget {
//   //BottomBar
//   const BottomBar({Key? key}) : super(key: key);

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   final _homeController = Get.put(HomeController());
//   // final _homeModel=HomeModel();
//   int selectedindex = 1;
//   @override
//   void initState() {
//     super.initState(); //appList
//     //_homeController.getApplist();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _bottomBarController = Get.put(BottomBarController());
//     // cameraController.dispose();
//     return AutoTabsScaffold(
//         animationDuration: const Duration(seconds: 0),
//         resizeToAvoidBottomInset: false,
//         routes: const [
//           ScanQrCodeSceen(),
//           HomeScreen(),
//           ProfileScreen(),
//         ],
//         builder: (context, child, animation) {
//           // obtain the scoped TabsRouter controller using context
//           // final tabsRouter = AutoTabsRouter.of(context);
//           // Here we're building our Scaffold inside of AutoTabsRouter
//           // to access the tabsRouter controller provided in this context
//           //
//           //alterntivly you could use a global key
//           return Scaffold(
//             body: Obx(
//               () => Stack(
//                 children: [
//                   _bottomBarController
//                               .selecClickButtomNavigetionBarback.value ==
//                           true
//                       ? Text('')
//                       : Text(''),
//                   FadeTransition(
//                     opacity: animation,
//                     // the passed child is techinaclly our animated selected-tab page
//                     child: child,
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     child: ClipRRect(
//                       child: BackdropFilter(
//                         filter: ImageFilter.blur(
//                           sigmaX: 1.0,
//                           sigmaY: 1.0,
//                         ),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           // height: 80,
//                           decoration: BoxDecoration(
//                             color: AppColor.buttonColor.withOpacity(
//                                 0.8), // Colors.black.withOpacity(0.5),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(defaultRadius * 2),
//                               topRight: Radius.circular(defaultRadius * 2),
//                             ),
//                           ),
//                           // alignment: Alignment.center,
//                           child: SafeArea(
//                             top: false,
//                             minimum: const EdgeInsets.only(
//                                 bottom: 20, top: 15, left: 30, right: 30),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: List.generate(
//                                 listNav.length,
//                                 (index) => GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _bottomBarController
//                                           .selecIndexButtomNavigetion
//                                           .value = index;
//                                       selectedindex = index;
//                                       AutoTabsRouter.of(context).setActiveIndex(
//                                           _bottomBarController
//                                               .selecIndexButtomNavigetion
//                                               .value);

//                                       //  AutoTabsRouter.of(context).setActiveIndex(index);
//                                       debugPrint(
//                                           '======= Index navigetion Bar : ${_bottomBarController.selecIndexButtomNavigetion.value}');
//                                     });
//                                   },
//                                   child: NavigationItem(
//                                     icon: listNav[index],
//                                     selected: _bottomBarController
//                                             .selecIndexButtomNavigetion.value ==
//                                         index,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
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
