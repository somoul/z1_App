// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z1_app/modules/home/controler/home_comtroller.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../widgets/custom_buttom.dart';

class AddDetaillAppScreen extends StatelessWidget {
  const AddDetaillAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController=Get.put(HomeController());
    final maxLines = 11;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adddetaill',
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: maxLines * 50.0,
              width: double.infinity,
              child: TextField(
                maxLines: maxLines,
                cursorHeight: 13,
                // controller: detaillAppEditingController,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 14.5,
                    color: AppColor.descriptionColor,
                    fontWeight: FontWeight.w300), //TextStyle(),
                onChanged: (value){
                  _homeController.isDetailApp.value=value=='';
                  _homeController.detailApp.value=value;
                  

                },
                decoration: InputDecoration(
                  // labelText: 'Enter your Password',
                  // hintText: "Enter your Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: AppColor.descriptionColor.withOpacity(0.4),
                        width: 1.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: AppColor.descriptionColor.withOpacity(0.5),
                        width: 1.8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 23, horizontal: 23),
                ),
              ),
            ),
            CustomButton(
              //myData
              padding: const EdgeInsets.only(left: 0, right: 20),
              onTap: () {
                //              myData = {
                // "app_colo": colorAppEditingController.text,
                //   'app_link': 'online-quiz-75798.firebaseapp.com',
                //   'app_name': 'test Add22',
                //   'isUser': true,
                //   'link_image':
                //       'https://firebasestorage.googleapis.com/v0/b/z1-app-a10ff.appspot.com/o/app_icon%2Fic_launcher.png?alt=media&token=36e2a95d-c989-42a4-9792-f2dfad770987'

                // };

                // collection
                //     .add(myData) // <-- Your data
                //     .then((_) => print('Added'))
                //     .catchError((error) => print('Add failed: $error'));
              },
              title: 'Success',
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
