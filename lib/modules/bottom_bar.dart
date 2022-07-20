import 'package:auto_route/auto_route.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../configs/auto_route/auto_route.gr.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectIndex = 1;
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        animationDuration: const Duration(seconds: 0),
        resizeToAvoidBottomInset: false,
        routes: const [
          ScanQrCodeSceen(),
          DassbordScreen(),
          ProfileScreen(),
        ],
        builder: (context, child, animation) {
          return Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            // bottomNavigationBar: ConvexAppBar(
            //   backgroundColor:const Color.fromARGB(255, 64, 172, 179),
             
            //   //top: 2,
            //   //style: TabStyle.react,
            //   items: const [
            //     // TabItem(icon: Icons.qr_code, title: 'QRCODE'),
            //     // TabItem(icon: Icons.home, title: 'HOME'),
            //     // TabItem(icon: Icons.person, title: 'PROFILE'),
            //   ],
            //   initialActiveIndex: selectIndex,
            //   onTap: (int index) {
            //     setState(() {
            //      selectIndex = index;
            //       AutoTabsRouter.of(context).setActiveIndex(selectIndex);
            //       debugPrint('=========$index=====');
            //     });
            //   },
            // ),
            // // SizedBox(
            //   width: MediaQuery.of(context).size.width > 1024
            //       ? 1024
            //       : MediaQuery.of(context).size.width,
            //  // padding: const EdgeInsets.only(bottom: 30, top: 10),
            //   height:70,
            //   //color: Colors.white,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: GestureDetector(
            //           onTap: () {
            //             index=0;
            //             AutoTabsRouter.of(context).setActiveIndex(0);
            //             debugPrint(' Show BottomNavigetionBar QRCode: 0');
            //           },
            //           child: Container(
            //            // color: Colors.black12,
            // child:  Icon(Icons.qr_code,size:30,
            //  color:index==0
            //         ? Colors.blue
            //         : Colors.black26
            // ),
            //           ),
            //         ),
            //       ),
            //        Expanded(
            //         child: GestureDetector(
            //           onTap: () {
            //             index=1;
            //              AutoTabsRouter.of(context).setActiveIndex(1);
            //             debugPrint(' Show BottomNavigetionBar Home: 1');
            //           },
            //           child: Container(
            //             //color: Colors.black12,
            //             child:  Icon(Icons.home,size:30,
            //               color:index==1
            //                     ? Colors.blue
            //                     : Colors.black26,
            //             ),
            //           ),
            //         ),
            //       ),
            //        Expanded(
            //         child: GestureDetector(
            //           onTap: () {
            //             index=2;
            //              AutoTabsRouter.of(context).setActiveIndex(2);
            //             debugPrint(' Show BottomNavigetionBar Profile: 2');
            //           },
            //           child: Container(
            //             //color: Colors.black12,
            //             // height:100,
            //             // width: 100,
            //             child:  Icon(Icons.person,size:30,
            //              color:index==2
            //                     ? Colors.blue
            //                     : Colors.black26),
            //           ),
            //         ),
            //       ),

            //     ],
          );
        });
  }
}
