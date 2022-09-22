// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z1_app/modules/home/controler/home_comtroller.dart';
import '../../../widgets/custom_chip.dart';
import '../../../widgets/customtextfield.dart';

class AddDetaillAppPandingScreen extends StatelessWidget {
  const AddDetaillAppPandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'AdddetaillPanding',
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(
        () =>
            // _homeController.isLoding.value
            //     ? Container()
            //     :
            SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 25,
            ),
            child: ListView.builder(
                // itemExtent:200,
                //    cacheExtent: 20,
                // primary: false,
                //  physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _homeController.pandingTextEditingController
                    .length, //_homeController.indexAdddetaillsuccess.value,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //     'Showe :${_homeController.successTextEditingController[index].text}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _homeController
                                    .pandingTextEditingController[index],
                              ),
                            ),
                            _homeController
                                        .pandingTextEditingController.length ==
                                    1
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      _homeController
                                          .pandingTextEditingController
                                          .removeAt(index);

                                      debugPrint('========show test:$index');
                                    },
                                    child: Container(
                                      height: 19,
                                      width: 19,
                                      margin: EdgeInsets.only(left: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.horizontal_rule,
                                        size: 15,
                                        color: Colors.white,
                                      )),
                                    ),
                                  )
                          ],
                        ),
                        index ==
                                _homeController
                                        .pandingTextEditingController.length -
                                    1
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CustomShip(
                                      title: 'View',
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: _homeController
                                                  .pandingTextEditingController
                                                  .length ==
                                              1
                                          ? const EdgeInsets.only(right: 1)
                                          : const EdgeInsets.only(right: 28),
                                      child: CustomShip(
                                          title: 'add file',
                                          onTap: () {
                                            _homeController
                                                .pandingTextEditingController
                                                .add(TextEditingController());
                                          }),
                                    ),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),

      // ),
    );
  }
}
