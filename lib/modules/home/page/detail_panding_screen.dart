// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z1_app/modules/home/controler/home_comtroller.dart';
import '../../../widgets/customtextfield.dart';

class AddDetaillAppPandingScreen extends StatelessWidget {
  const AddDetaillAppPandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController = Get.put(HomeController());
    // final maxLines = 11;
    int indexAdddetaillsuccess = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AdddetaillPanding',
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
                shrinkWrap: true,
                // cacheExtent: 200,
                padding: EdgeInsets.only(top: 10),
                //itemExtent: 10.0,
                scrollDirection: Axis.vertical,
                itemCount: _homeController.indexAdddetaillsuccess
                    .value, //_homeController.indexAdddetaillsuccess.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: index == 0
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: index == 0
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      index == 0 ? const Text('product detail :') : Container(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(' Test :${_homeController.successTextEditingController[index].text}'),
                          Padding(
                            padding: index != 0
                                ? const EdgeInsets.only(left: 65, top: 10)
                                : const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                CustomTextField(
                                    //controller:_homeController.successTextEditingController[index],
                                    ),
                                GestureDetector(
                                  onDoubleTap: () {
                                    _homeController.indexAdddetaillsuccess
                                        .value = _homeController
                                            .indexAdddetaillsuccess.value -
                                        1;
                                  },
                                  child: Container(
                                    height: 18,
                                    width: 18,
                                    margin: EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                        child: Icon(
                                      Icons.horizontal_rule,
                                      size: 15,
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          index ==
                                  _homeController.indexAdddetaillsuccess.value -
                                      1
                              ? TextButton(
                                  onPressed: () {
                                    _homeController.indexAdddetaillsuccess
                                        .value = _homeController
                                            .indexAdddetaillsuccess.value +
                                        1;
                                    //_homeController.indexAdddetaillsuccess.add(1);
                                    //  indexAdddetaillsuccess=indexAdddetaillsuccess+1;
                                  },
                                  child: Text('one:'))
                              : Container()
                        ],
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),

      // ),
    );
  }
}
