// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, invalid_use_of_protected_member, deprecated_member_use, await_only_futures

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quick_actions/quick_actions.dart';

import '../../../utils/stolocal_data/local_data.dart';
import '../../../widgets/common/custom_textformfield.dart';
import '../../../widgets/custom_default_size_web.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cameraController = MobileScannerController();
  final QuickActions quickActions = const QuickActions();

  @override
  void initState() {
    LocalData.getCurrentUser();
    quickActions.initialize((shortcutType) {
      print(shortcutType);
      if (shortcutType == 'qr') {
        context.go('/qr');
      }

      // More handling code...
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'qr', localizedTitle: 'Scan Qr Code', icon: 'Icons.add_circle'),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDefaultSizeWeb(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 3, top: 6),
              child: IconButton(
                  onPressed: () {
                    //addAppScreen
                    // context.navigateNamedTo('addAppScreen');
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 27,
                  )),
            )
            // Padding(
            //   padding: const EdgeInsets.only(
            //     bottom: 1,
            //     right: 5,
            //   ),
            //   child: GestureDetector(
            //     onTap: () {
            // context.navigateNamedTo('qrcodeScreen');
            // //  context.navigateNamedTo('scanqrcodesceen');
            //     },
            //     child: Image.asset(
            //       'asset/image/image_png/qr_code.png',
            //       width: 63,
            //       height: 61,
            //     ),
            //   ),
            // ),
          ],
          leading: Container(),
          title: Text('Home'),
        ),
        body:
            // StreamBuilder<QuerySnapshot>(
            //   stream: FirebaseFirestore.instance
            //       .collection("app_list")
            //       .where('isUser', isEqualTo: true)
            //       .snapshots(),
            //   builder: (
            //     BuildContext context,
            //     AsyncSnapshot<QuerySnapshot> snapshot,
            //   ) {
            //     try {
            //       _homeController.homeListModel.value.clear();
            //       var listApp = snapshot.data!.docs;

            //       listApp.map((product) {
            //         final item =
            //             HomeModel.fromJson(product.data() as Map<String, dynamic>);
            //         _homeController.homeListModel.value.add(item);
            //         debugPrint('======  _homeController.homeListModel.value:$item');
            //       }).toList();
            //     } catch (e) {
            //       debugPrint("Catch Data:$e");
            //     }

            //     return !snapshot.hasData
            //         ? const Center(child: CircularProgressIndicator())
            //         : GridView.builder(
            //             itemCount: _homeController.homeListModel.value.length,
            //             scrollDirection: Axis.vertical,
            //             padding: const EdgeInsets.only(
            //                 left: 18, right: 23, bottom: 130, top: 125),
            //             gridDelegate:
            //                 const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 4,
            //               mainAxisSpacing: 20,
            //               crossAxisSpacing: 18,
            //               childAspectRatio: 1,
            //             ),
            //             itemBuilder: (BuildContext context, int index) {
            //               //  DocumentSnapshot data = snapshot.data!.docs[index];

            //               return CustomCart(
            //                   title: _homeController
            //                           .homeListModel.value[index].app_name ??
            //                       '',
            //                   image: _homeController
            //                           .homeListModel.value[index].link_image ??
            //                       '',
            //                   colors: _homeController
            //                           .homeListModel.value[index].app_color ??
            //                       '',
            //                   onTap: () async {
            //                     await Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => MiniAppScreen(
            //                                 linkApp:
            //                                     '${_homeController.homeListModel[index].app_link}',
            //                               )),
            //                     );
            //                   });
            //             },
            //           );
            //   },
            // ),
            Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextFormField(
              hintText: 'Input Hint Text',
              validated: true,
            ),
            CustomTextFormField(
              hintText: 'Input Hint Text',
              validated: true,
            ),
            CustomTextFormField(
              hintText: 'Input Hint Text',
              validated: true,
            ),
          ],
        ),
      ),
    );
  }
}
